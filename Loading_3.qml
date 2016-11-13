import QtQuick 2.7
import QtQuick.Controls 2.0

Item {
    anchors.fill: parent
    id:root

    property int xposition: root.width/2 - 25
    property int yposition: root.height/2 - 25
    property int circleSize: 50
    property int speed: 1500
    signal finished()

    function start(){
        pathAnimBlue.start()
        pathAnimRed.start()
        console.log(xposition)
    }
    function stop(){
        pathAnimBlue.stop()
        pathAnimRed.stop()
        stopAnimationBlue.start()
        stopAnimationRed.start()

    }
    SequentialAnimation {
        running: true
        loops: -1
        id: pathAnimBlue

        PauseAnimation { duration: 10 }
        //! [0]
        PathAnimation {

            duration: speed*3
            easing.type: Easing.InQuad

            target: blueRect
            orientation: PathAnimation.RightFirst
           // anchorPoint: Qt.point(root.width/2,root.height/2)
            path:Path {


                startX:xposition - 75
                startY:yposition- 75

                PathArc {
                    x:xposition  - 1 - 75
                    y:yposition  +1- 75
                    radiusX: 100
                    radiusY: 100
                    useLargeArc: true
                }
            }
        }
        //! [0]
    }

    SequentialAnimation {
        running: true
        loops: -1
        id: pathAnimRed

        PauseAnimation { duration: 10 }
        //! [0]
        PathAnimation {

            duration: speed*3
            easing.type: Easing.InQuad
            running: false
            target: redRect
            //orientation: PathAnimation.BottomFirst
            //anchorPoint: Qt.point(root.width/2,root.height/2)
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



    NumberAnimation {
        id:ziroOpacity
        targets:yellowRect
        property:"opacity"
        to:0
        duration: 3000
        running: false
        onStopped: root.finished()

    }

    SequentialAnimation {
        id: stopAnimationBlueToEnd

        running: false
        alwaysRunToEnd: true



        NumberAnimation {
            target: yellowRect;
            property:"width"
            to: root.height*2
            duration: 5000
            running: false
        }
        onStopped: {
            ziroOpacity.start()
        }
    }

    SequentialAnimation {
        id: stopAnimationBlue
        onStopped: {

            blueRect.anchors.centerIn=root
            blueRect.z=1
            redRect.z=0
            redRect.opacity=0
            blueRect.opacity=0
            underrec.opacity=0
            underanimation.stop()
            topanimeYellow.stop()
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
    }



    Rectangle {
        id: yellowRect
        anchors.centerIn: parent

        width: circleSize
        height: width
        color:"#FFEB3B"
        antialiasing: true
        radius: width/2
        MouseArea{
            anchors.fill: parent
            onClicked:{

                stop()
            }


        }
        SequentialAnimation on width {
            id:topanimeYellow
            loops: Animation.Infinite
            running: true
            NumberAnimation { from: circleSize; to: circleSize - circleSize/5; duration: speed; easing.type: Easing.InOutQuad }
            NumberAnimation { from: circleSize - circleSize/5; to: circleSize; duration: speed; easing.type: Easing.InOutQuad }
            PauseAnimation { duration: 200 } // This puts a bit of time between the loop
        }

        Rectangle{
            id:underrec
            color:"#FFEB3B"
            opacity: 0.3
            width: circleSize - circleSize/5
            height: width
            radius: width/2
            anchors.centerIn: parent





            x:xposition - 75
            y:yposition - 75


            SequentialAnimation on width {
                id:underanimation
                loops: Animation.Infinite
                running: true
                NumberAnimation { from: circleSize - circleSize/5; to: circleSize; duration: speed; easing.type: Easing.InOutQuad }
                NumberAnimation { from: circleSize; to: circleSize - circleSize/5; duration: speed; easing.type: Easing.InOutQuad }
                PauseAnimation { duration: 200 } // This puts a bit of time between the loop
            }
        }

    }
    Rectangle {
        id: blueRect
        x:xposition - 75
        y:yposition - 75

        width: circleSize
        height: width
        color:"#2196F3"
        antialiasing: true
        radius: width/2
        MouseArea{
            anchors.fill: parent
            onClicked: start()
        }

    }

    Rectangle {
        id: redRect
        x:xposition + 70
        y:yposition +70

        width: circleSize
        height: width
        color:"#F44336"
        antialiasing: true
        radius: width/2



    }


}


