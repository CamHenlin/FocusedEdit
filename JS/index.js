class FocusedEdit {

    sendKeyDown (key) {

        console.log(`key received: ${key}`)

        return `ACK`
    }
}

module.exports = FocusedEdit
