import QtQuick

// EXERCISE
// replace FocusScope with Item, and guess what will happen then !

FocusScope {
    // as a FocusScope, MyItem's focus is isolated from its siblings; considering the focus,
    // "what happens in MyItem stays in MyItem"
    id: root

    Column {
        anchors.fill: parent
        spacing: 10

        Rectangle {
            id: item11
            width: parent.width; height: (parent.height - parent.spacing) / 2
            border.width: 1
            color: activeFocus ? "red" : "transparent"
            Component.onCompleted: console.log("-----item11 completed")

            Text { text: `item11 ${item11.activeFocus ? ": active focus!" : ""}` }
        }
        Rectangle {
            id: item12
            width: parent.width; height: (parent.height - parent.spacing) / 2
            border.width: 1
            color: activeFocus ? "blue" : "transparent"

            // ********
            // item2 requires the focus; so, since it's the only one to do so in the current FocusScope,
            // item2 will actually get the active focus as soon as MyItem gets the active focus
            focus: true
            // ********

            Component.onCompleted: console.log("-----item12 completed")

            Text { text: `item12 ${item12.activeFocus ? ": active focus!" : ""}` }
        }
    }
}

