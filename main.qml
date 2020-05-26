import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello QML World! This is JSON")

    TreeView {
        id: treeView
        model: jsonModel
        anchors.fill: parent

        TableViewColumn {
            id: keyCol
            title: "key"
            role: "key"
            delegate: EditorDelegate {
                text: styleData.value
                onTextChanged: {
                    /* 
                       this calls setData in the model,
                       which in turn emits dataChanged signal
                    */
                    model.key = text
                }
            }
        }

        TableViewColumn {
            id: valueCol
            title: "value"
            role: "value"
            movable: false
            width: treeView.viewport.width - keyCol.width
            delegate: EditorDelegate {
                text: styleData.value
                onTextChanged: {
                    /* 
                       this calls setData in the model,
                       which in turn emits dataChanged signal
                    */
                    model.value = text
                }
            }
        }
    }  
}
