import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import "SwitchKey"
import "loading"
import "menu"
ApplicationWindow {

    visible: true
    flags: Screen.width > Screen.height ?   Qt.NoItemFlags :Qt.FramelessWindowHint
    width: Screen.width > Screen.height ? 480:Screen.width
    height:  Screen.width > Screen.height ? 853 :Screen.height
    title: qsTr("Material Samples")

    id:mainWindow
    // create shortcut for quit fast
    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }





    //creat loading for start
    Loading_4{
        onFinished: {
            myload.sourceComponent=cpo
        }
    }



    //creating all Components for loading by buttons
    Component{
        id:cpo
        CirclePageOpen{

            onFinished: {
                //myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:l1
        Loading_1{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:l2
        Loading_2{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:l3

        Loading_3{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }
    Component{
        id:sk1

        SwitchKey_1{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:sk2

        SwitchKey_2{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:sk3

        SwitchKey_3{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:sk4

        SwitchKey_4{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }




    Component{
        id:l4
        Loading_4{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:l5
        Loading_5{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:cmc
        ColorMenuChange{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:fp
        FloatPage{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Component{
        id:ocm
        OpenCircleMenu{
            onFinished: {
                myload.sourceComponent=cpo
            }
        }


    }

    Loader{
        id:myload
        anchors.fill: parent

    }


}
