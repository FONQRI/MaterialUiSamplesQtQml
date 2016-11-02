import QtQuick 2.0
import QtQuick.Controls.Material 2.0
Item {
    anchors.fill: parent
    visible: true
    id:root
    property int loadingSize: parent.width>parent.height?(parent.height/5)*2:(parent.width/5)*2
    property bool startLoad:false

signal finished()


function start(){

    topanimeStart.start()
    underanimationStart.start()
    startLoad=true
}

function stop(){

    topanimeStart.stop()
    underanimationStart.stop()
    stopLoading.start()
    opacityUnderRect.start()
    startLoad=false

}
    Rectangle{
        id:topRec
        color:"#2196F3"

        width: loadingSize
        height: width
        radius: width/2
        anchors.centerIn: parent
        MouseArea{
            anchors.fill :parent
            onClicked:
            {
                if(startLoad)
                    stop()
                else
                start()

            }

        }
        SequentialAnimation on width{
            id:topanimeStart
            loops: Animation.Infinite
            running: false
            alwaysRunToEnd: true
            NumberAnimation { from: loadingSize; to: loadingSize - loadingSize/5; duration: 1500; easing.type: Easing.InOutQuad }
            NumberAnimation { from: loadingSize - loadingSize/5; to: loadingSize; duration: 1500; easing.type: Easing.InOutQuad }
            PauseAnimation { duration: 200 } // This puts a bit of time between the loop
        }
        SequentialAnimation on width{
            id:stopLoading
            running: false
            alwaysRunToEnd: true
            NumberAnimation{to: 0;duration: 1500}
            NumberAnimation{to: parent.height*2;duration: 3000}
            NumberAnimation{
                target:topRec
                property: "opacity"
                    to: 0
                    duration: 3000

            }
            onStopped: root.finished()

        }


    }

    Rectangle{
        id:underrec
        color:"#2196F3"
        opacity: 0.3
        width: loadingSize - loadingSize/5
        height: width
        radius: width/2
        anchors.centerIn: parent








        SequentialAnimation on width{
            id:underanimationStart
            loops: Animation.Infinite
            running: false
            alwaysRunToEnd: true

            NumberAnimation { from: loadingSize - loadingSize/5; to: loadingSize; duration: 1500; easing.type: Easing.InOutQuad }
            NumberAnimation { from: loadingSize; to: loadingSize - loadingSize/5; duration: 1500; easing.type: Easing.InOutQuad }
            PauseAnimation { duration: 200 } // This puts a bit of time between the loop
        }

        NumberAnimation{
            target: underrec
            id:opacityUnderRect
            property:"opacity"
            to: 0
            duration: 500
        }

    }
}
