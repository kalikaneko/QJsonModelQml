import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

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

	    Text {
		anchors.verticalCenter: parent.verticalCenter
		text: styleData.value
	    }
	}

        TableViewColumn {
            id: keyCol
            title: "key"
            role: "key"
            delegate: EditorDelegate {
                text: styleData.value
                onTextChanged: model.key = text
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
                onTextChanged: model.value = text
            }
        }

    }  
}
