const log = console.log
// initialize http server, socket.io and port number
const http = require('http')
const express = require('express')
const app = express()
const server = http.createServer(app)
const { Server } = require("socket.io");
const { text } = require('express')
const io = new Server(server);
const os = require('os');
const networkInterfaces = os.networkInterfaces();
let validAddresses = []

const port = 3000
const DEBUGGING = false
const MAX_RETRY = 5

const html = `
<html>
<title>FocusedEdit</title>
<body style="background-color: #ffffff;opacity: 1;background-image: repeating-linear-gradient(45deg, #000000 25%, transparent 25%, transparent 75%, #000000 75%, #000000), repeating-linear-gradient(45deg, #000000 25%, #ffffff 25%, #ffffff 75%, #000000 75%, #000000);background-position: 0 0, 1px 1px;background-size: 2px 2px;">
    <div style="width: 100%; align: center;">
        <h1>
            FocusedEdit
        </h1>
        <h5>
            <a href="https://github.com/CamHenlin/FocusedEdit" target="_new">help</a>
        </h5>
        <textarea style="display: block; margin-left: auto; margin-right: auto; border: 2px black solid; padding: 8px;" placeholder="enter text to begin" rows="30" cols="50" id="editor"></textarea>
    </div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.1/socket.io.min.js"></script>
<script>
    const socket = io();

    function getEl(id) {
        return document.getElementById(id)
    }

    const editor = getEl("editor")

    editor.addEventListener("keyup", (evt) => {
        const text = editor.value
        socket.send(text)
    })

    socket.on('message', (data) => {
        editor.value = data
    })
</script>
</html>
`

// we want to get all of the IP addresses for the host machine so that we can return it to the Mac app
// and the user can pull up the shared editor website in their browser
for (const namedInterface of Object.keys(networkInterfaces)) {

    for (const networkInterface of networkInterfaces[namedInterface]) {

        if (!networkInterface || !networkInterface.family || networkInterface.family !== `IPv4`) {

            continue
        }

        // if (networkInterface.address === `127.0.0.1`) {

        //     continue
        // }

        validAddresses.push(`http://${networkInterface.address}:3000/`)
    }
}

let coprocessorCallIndex = 0
let textBuffer = ``
let sanitizedForOldMachineTextBuffer = `` // here we will replace new lines with carriage returns

const updateTextBuffer = () => {

    sanitizedForOldMachineTextBuffer = ``

    for (const character of textBuffer.split(``)) {

        switch (character.charCodeAt(0)) {

            case 10:

                sanitizedForOldMachineTextBuffer = `${sanitizedForOldMachineTextBuffer}${String.fromCharCode(13)}`
                break
            case 8212: // combined -- character, often auto-replaced on modern Macs

                sanitizedForOldMachineTextBuffer = `${sanitizedForOldMachineTextBuffer}-`
                break
            // the next 2 are stylized open and close quotes, often auto-replaced on modern Macs
            case 8220:
            case 8221:

                sanitizedForOldMachineTextBuffer = `${sanitizedForOldMachineTextBuffer}"`
                break
            default:

                sanitizedForOldMachineTextBuffer = `${sanitizedForOldMachineTextBuffer}${character}`
                break
        }
    }
}

io.on('connection', (socket) => {

    log('connected')

    socket.on('message', (message) => {

        if (DEBUGGING) {

            log(`event:`)
            log(message)
        }

        textBuffer = message

        socket.broadcast.emit('message', textBuffer)
        updateTextBuffer()
    })
})

io.on('disconnect', (evt) => {

    log('some people left')
})

app.get('/', (req, res) => {

    res.send(html)
})

server.listen(port, () => {

    console.log(`listening on *:${port}`);
});

const insertStringToBuffer = (string, startPosition, endPosition) => {

    switch (string.charCodeAt(0)) {

        // backspace
        case 8:

            if (startPosition === endPosition) {

                startPosition--
            }

            textBuffer = `${textBuffer.slice(0, startPosition)}${textBuffer.slice(endPosition, textBuffer.length)}`
            break
        // carriage return, convert to newline
        case 13:

            textBuffer = `${textBuffer.slice(0, startPosition)}${String.fromCharCode(10)}${textBuffer.slice(endPosition, textBuffer.length)}`
            break
        // end of transmission character
        case 4:
        // arrow keys
        case 28:
        case 29:
        case 30:
        case 31:
        // esc, clear
        case 27:
        // unicode fallback character
        case 65533:

            return
        // delete -- this is how delete would work, but we don't actually create a delete key event ever in our mac app. 
        // see the DoKeyDown function in TESample.c
        // case 127:

        //     if (startPosition === endPosition) {

        //         endPosition++
        //     }

        //     textBuffer = `${textBuffer.slice(0, startPosition)}${textBuffer.slice(endPosition, textBuffer.length)}`
        //     break
        default:

            textBuffer = `${textBuffer.slice(0, startPosition)}${string}${textBuffer.slice(endPosition, textBuffer.length)}`
            break
    }

    io.emit('message', textBuffer)
    updateTextBuffer()

    if (DEBUGGING) {

        console.log(`textBuffer is now: ${textBuffer}`)
    }
}

class FocusedEdit {

    insertStringToBuffer (string, startPosition, endPosition, callIndex, retryCounter) {

        if (!string || string === `` || !startPosition || !endPosition || !callIndex) {

            return
        }

        if (DEBUGGING) {

            console.log(`insertStringToBuffer(${string}, ${startPosition}, ${endPosition}, ${callIndex}): coprocessorCallIndex: ${coprocessorCallIndex}, ASCII: ${String.fromCharCode(string)}`)
        }

        string = String.fromCharCode(string)

        // we have to track the call index because sometimes the serial port can be slow,
        // and calls will come in out of order. If we're not ready for the call, rerun it in 50ms
        if (Number(callIndex) !== coprocessorCallIndex && (!retryCounter || retryCounter < MAX_RETRY)) {

            if (DEBUGGING) {

                console.log(`Number(callIndex) !== coprocessorCallIndex, callIndex: ${callIndex}, coprocessorCallIndex: ${coprocessorCallIndex}, queueing retry`)
            }

            return setTimeout(() => {

                if (!retryCounter) {

                    retryCounter = 0
                }

                this.insertStringToBuffer(string, startPosition, endPosition, callIndex, retryCounter++)
            }, 50)
        }

        if (retryCounter && retryCounter > MAX_RETRY) {

            coprocessorCallIndex = Number(callIndex)
        } else {

            coprocessorCallIndex++
        }

        insertStringToBuffer(string, Number(startPosition), Number(endPosition))

        return
    }

    getBuffer () {

        return sanitizedForOldMachineTextBuffer
    }

    getValidAddresses () {

        return `x${validAddresses.join(`, `)}`
    }
}

module.exports = FocusedEdit
