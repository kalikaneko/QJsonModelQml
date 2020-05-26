import QtQuick 2.0
// really elegant, thanks to https://stackoverflow.com/a/54114488

Rectangle {
    id: root
    color: ( styleData.row % 2 == 0 ) ? "white" : "lightblue"
    property string text
    property bool mode: false

    Component{
        id: component_display
        Text{}
    }

    Component{
        id: component_edit
        TextInput{}
    }

    Loader{
        id: loader
        anchors.fill: parent
        sourceComponent: mode ? component_edit: component_display
        onSourceComponentChanged: {
            loader.item.text = root.text
            if(sourceComponent === component_edit){
                loader.item.editingFinished.connect(onEditingFinished)
                loader.item.forceActiveFocus()
            }
        }
        function onEditingFinished(){
            text = loader.item.text
            mode = false
        }

        MouseArea{
            anchors.fill: parent
            onDoubleClicked: {
                if (mouse.button & Qt.LeftButton)
                    mode = true
            }
        }
    }
}
