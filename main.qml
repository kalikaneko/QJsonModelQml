import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

//import foo 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello world")

    TreeView {
        id: treeView
        model: jsonModel
        anchors.fill: parent

        itemDelegate: Rectangle {
                   color: ( styleData.row % 2 == 0 ) ? "white" : "lightblue"
                   //height: 20

                   Text {
                       anchors.verticalCenter: parent.verticalCenter
                       text: styleData.value === undefined ? "" : styleData.value
                   }
               }


        TableViewColumn {
            id: keyCol
            title: "key"
            role: "key"
        }
        TableViewColumn {
            id: valueCol
            title: "value"
            role: "value"
            movable: false
            width: treeView.viewport.width - keyCol.width
        }

    }  
}
