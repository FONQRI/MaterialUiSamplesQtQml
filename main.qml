import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import "SwitchKey"
import "loading"
import "menu"
ApplicationWindow {


    visible: true
    flags: Screen.width > Screen.height ?   Qt.NoItemFlags :Qt.FramelessWindowHint
    width: Screen.width > Screen.height ? 480:Screen.width
    height:  Screen.width > Screen.height ? 853 :Screen.height
    title: qsTr("Material Samples")


    Item {

        id:mainItem

        focus: true
        Keys.onPressed: {
            if (event.key === Qt.Key_Q) {
                Qt.quit()
            }
        }
        anchors.fill: parent


    }


//        TemplateOfMine{
//        }

            Loading_4{
onFinished: {
    console.log("Finished...")
}
            }
//            CirclePageOpen{

//            }


//        SwitchKey_4{

//        }
}
