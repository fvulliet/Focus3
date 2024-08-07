import QtQuick

Window {
    // note: Window is a FocusScope
    width: 640
    height: 480
    visible: true
    title: qsTr("A demo to demonstrate the sake of FocusScope")

    Column {
        id: mainColumn
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        MyItem {
            // MyItem is a FocusScope, therefore its own focus is isolated from mainColumn's focus;
            // Hence, item1 is given the focus, because it requires it in the current FocusScope (Window)
            id: item3
            width: parent.width; height: (parent.height - parent.spacing) / 2
            Component.onCompleted: console.log("-----MyItem completed")
        }

        Rectangle {
            id: item1
            width: parent.width; height: (parent.height - parent.spacing) / 2
            border.width: 1
            color: activeFocus ? "green" : "transparent"

            // ********
            focus: true // item1 requires the focus
            // ********

            Component.onCompleted: console.log("-----item1 completed")

            Text { text: `item1 ${item1.activeFocus ? ": active focus!" : ""}` }
        }
    }
}
