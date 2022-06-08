const log = console.log
// initialize http server, socket.io and port number
const http = require('http')
const express = require('express')
const app = express()
const server = http.createServer(app)
const { Server } = require("socket.io");
const { text } = require('express')
const io = new Server(server);
const port = 3000
const DEBUGGING = true

const html = `
<html>
<title>FocusedEdit</title>
<body>
    <div>
        <textarea rows="30" cols="50" id="editor"></textarea>
    </div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.1/socket.io.min.js"></script>
<script>
    const socket = io();

    const l = console.log

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
            default:

                sanitizedForOldMachineTextBuffer = `${sanitizedForOldMachineTextBuffer}${character}`
                break
        }
    }
}

io.on('connection', (socket) => {

    log('connected')

    socket.on('message', (message) => {

        log(`event:`)
        log(message)
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

                endPosition = endPosition + 1
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
        default:

            textBuffer = `${textBuffer.slice(0, startPosition)}${string}${textBuffer.slice(endPosition, textBuffer.length)}`
            break
    }

    io.emit('message', textBuffer)
    updateTextBuffer()
}

class FocusedEdit {

    insertStringToBuffer (string, startPosition, endPosition, callIndex) {

        if (!string || !startPosition || !endPosition || !callIndex) {

            return
        }

        if (DEBUGGING) {

            console.log(`insertStringToBuffer(${string}, ${startPosition}, ${endPosition}, ${callIndex}): ASCII:`)

            for (const character of string.split(``)) {

                console.log(character.charCodeAt(0))
            }
        }

        // we have to track the call index because sometimes the serial port can be slow,
        // and calls will come in out of order. If we're not ready for the call, rerun it in 50ms
        if (Number(callIndex) !== coprocessorCallIndex) {

            return setTimeout(() => {

                this.insertStringToBuffer(string, startPosition, endPosition, callIndex)
            }, 50)
        }

        coprocessorCallIndex++

        insertStringToBuffer(string, Number(startPosition), Number(endPosition))

        return
    }

    getBuffer () {

        return sanitizedForOldMachineTextBuffer
    }
}

module.exports = FocusedEdit
