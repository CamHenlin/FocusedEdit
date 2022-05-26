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
    const socket = io('http://localhost:3000');

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

let textBuffer = ``

io.on('connection', (socket) => {

    log('connected')

    socket.on('message', (message) => {

        log(`event:`)
        log(message)
        textBuffer = message

        socket.broadcast.emit('message', textBuffer)
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

const insertStringToBuffer = (string, position) => {

    textBuffer = `${textBuffer.slice(0, position)}${string}${textBuffer.slice(position, textBuffer.length)}`

    io.emit('message', textBuffer);
}

class FocusedEdit {

    sendKeyDown (key) {

        console.log(`key received: ${key}`)

        return `ACK`
    }

    insertStringToBuffer (string, position) {

        insertStringToBuffer(string, Number(position))

        return
    }

    getBuffer () {

        return textBuffer
    }
}

module.exports = FocusedEdit
