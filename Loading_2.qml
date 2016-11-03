import QtQuick 2.7
import QtQuick.Controls 2.0

Item {
    anchors.fill: parent
    id:root
    property int xposition: root.width/2 - 25
    property int yposition: root.height/2 - 25
    property int circleSize: 50
    signal finished()

    function start(){
        pathAnimBlue.start()
        pathAnimRed.start()
    }
    function stop(){
        pathAnimBlue.stop()
        pathAnimRed.stop()
        stopAnimationBlue.start()
        stopAnimationRed.start()

    }

    SequentialAnimation {
        id: pathAnimBlue

        running: false
        loops: -1
        alwaysRunToEnd: true
        //! [0]
        PathAnimation {

            duration: 5000
            easing.type: Easing.InQuad

            target: blueRect
            // orientation: PathAnimation.RightFirst
            path:Path {
                startX: xposition - 75
                startY: yposition - 75

                PathArc {
                    x: xposition - 1 - 75
                    y: yposition +1 - 75
                    radiusX: 100
                    radiusY: 100
                    useLargeArc: true
                }
            }
        }
        //! [0]
    }

    SequentialAnimation {
        id: pathAnimRed

        running: false
        loops: -1
        alwaysRunToEnd: true

        PauseAnimation { duration: 10 }
        //! [0]
        PathAnimation {

            duration: 5000
            easing.type: Easing.InQuad

            target: redRect
            path:Path {
                startX:xposition  +70
                startY:yposition  +70
                PathArc {

                    x:xposition  + 1 +70
                    y:yposition  -1 +70
                    radiusX: 100
                    radiusY: 100
                    useLargeArc: true
                }
            }
        }
        //! [0]
    }

    SequentialAnimation {
        id: stopAnimationBlue
onStopped: {

    blueRect.anchors.centerIn=root
    blueRect.z=1
    redRect.z=0
      redRect.opacity=0
    stopAnimationBlueToEnd.start()

}

        running: false
        alwaysRunToEnd: true

        //! [0]
        PathAnimation {

            duration: 5000
            easing.type: Easing.InQuad

            target: blueRect
            path:Path {

                PathArc {

                    x:root.width/2 - circleSize/2
                    y:root.height/2 - circleSize/2
                    radiusX: 100
                    radiusY: 100
                    useLargeArc: true
                }
            }
        }
        //! [0]
    }

    SequentialAnimation {
        id: stopAnimationRed

        running: false
        alwaysRunToEnd: true

        //! [0]
        PathAnimation {

            duration: 5000
            easing.type: Easing.InQuad

            target: redRect
            path:Path {

                PathArc {

                    x:root.width/2 - circleSize/2
                    y:root.height/2 - circleSize/2
                    radiusX: 100
                    radiusY: 100
                    useLargeArc: true
                }
            }
        }
        //! [0]
    }



        NumberAnimation {
            id:ziroOpacity
            targets: [blueRect,redRect];
            property:"opacity"
            to:0
            duration: 5000
            running: false
            onStopped: root.finished()

        }

    SequentialAnimation {
        id: stopAnimationBlueToEnd

        running: false
        alwaysRunToEnd: true



        NumberAnimation {
            target: blueRect;
            property:"width"
            to: root.height*2
            duration: 5000
            running: false
        }
        onStopped: {
            ziroOpacity.start()
        }
    }

    //recangles
    Rectangle {
        id: blueRect
        x: xposition  - 75
        y: yposition  - 75

        width: 50
        height: width
        color:"#2196F3"
        antialiasing: true
        radius: width/2
        MouseArea{
            anchors.fill: parent
            onClicked:
            {

                root.stop();

            }
        }
    }

    Rectangle {
        id: redRect

        x:xposition  + 1 +70
        y:yposition  -1 +70
        width: 50
        height: width
        color:"#F44336"
        antialiasing: true
        radius: width/2
        MouseArea{
            anchors.fill: parent
            onClicked:
            {

                root.start();

            }
        }

    }
}


