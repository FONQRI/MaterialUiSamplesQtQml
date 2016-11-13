import QtQuick 2.7
import QtQuick.Controls 2.0
Rectangle {
    anchors.fill: parent
    color:"#263238"
    id:root
    property int xposition: root.width/2 - 25
    property int yposition: root.height/2 - 25
    property int circleSize: 50
    property int speed: 1500
    signal finished()


    function start(){
        pathAnimBlue.start()
        pathAnimRed.start()
        pathAnimGreen.start()
    }
    function stop(){
        pathAnimBlue.stop()
        pathAnimRed.stop()
        pathAnimGreen.stop()
        stopAnimationBlue.start()
        stopAnimationRed.start()
        stopAnimationGreen.start()

    }



    SequentialAnimation {
        running: true
        loops: -1
        id: pathAnimBlue

        PauseAnimation { duration: 0 }
        //! [0]
        PathAnimation {

            duration: speed*10
            //easing.type: Easing.InQuad

            target: blueRect
            orientation: PathAnimation.RightFirst
            //anchorPoint: Qt.point(root.width/2,root.height/2)
            path:Path {
                startX:xposition - 100
                startY:yposition- 100

                PathArc {
                    x:xposition  - 1 - 100
                    y:yposition  +1- 100
                    radiusX: 140
                    radiusY: 140
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

        PauseAnimation { duration: 0 }
        //! [0]
        PathAnimation {

            duration: speed*6

            target: redRect
            //anchorPoint: Qt.point(root.width/2,root.height/2)

            path:Path {
                startX:xposition  +75
                startY:yposition +75
                PathArc {

                    x:xposition - 1+75
                    y:yposition +1 +75
                    radiusX: 90
                    radiusY: 90
                    useLargeArc: true

                    direction : PathArc.Counterclockwise

                }
            }
        }
        //! [0]
    }


    SequentialAnimation {
        running: true
        loops: -1
        id: pathAnimGreen

        PauseAnimation { duration: 0 }
        //! [0]
        PathAnimation {

            duration: speed*3
            //easing.type: Easing.InQuad

            target: greenRect
            //orientation: PathAnimation.BottomFirst
            //anchorPoint: Qt.point(root.width/2,root.height/2)
            path:Path {
                startX:xposition  - 25
                startY:yposition   - 25
                PathArc {

                    x:xposition  - 1 -25
                    y:yposition +1 -25
                    radiusX: 60
                    radiusY: 60
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
onClicked: stop()
}

    SequentialAnimation on width {
        id:topanimeYellow
        loops: Animation.Infinite
        running: true
        NumberAnimation { from: circleSize; to: circleSize - circleSize/5; duration: speed; easing.type: Easing.InOutQuad }
        NumberAnimation { from: circleSize - circleSize/5; to: circleSize; duration: speed; easing.type: Easing.InOutQuad }
        PauseAnimation { duration: 200 } // This puts a bit of time between the loop
    }
    }

    Rectangle{
        id:underrec
        color:"#FFEB3B"
        opacity: 0.3
        width: circleSize - circleSize/5
        height: width
        radius: width/2
        anchors.centerIn: parent

        SequentialAnimation on width {
            id:underanimation
            loops: Animation.Infinite
            running: true
            NumberAnimation { from: circleSize - circleSize/5; to: circleSize; duration: speed; easing.type: Easing.InOutQuad }
            NumberAnimation { from: circleSize; to: circleSize - circleSize/5; duration: speed; easing.type: Easing.InOutQuad }
            PauseAnimation { duration: 200 } // This puts a bit of time between the loop
        }
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
                    direction : PathArc.Counterclockwise

                }
            }
        }
        //! [0]
    }

    SequentialAnimation {
        id: stopAnimationBlue
onStopped: {

    blueRect.anchors.centerIn=root
    redRect.anchors.centerIn=root
    greenRect.anchors.centerIn=root
    blueRect.z=1
    redRect.z=2
      greenRect.z=3
    yellowRect.z=0
    underrec.opacity=0
    underanimation.stop()
    topanimeYellow.stop()
yellowextend.start()
    blueextend.start()
    redextend.start()
    greenextend.start()
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
        id: stopAnimationGreen

        running: false
        alwaysRunToEnd: true

        //! [0]
        PathAnimation {

            duration: 5000
            easing.type: Easing.InQuad

            target: greenRect
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
        id:yellowextend
        target:yellowRect
        property:"width"
        to:root.height*2
        duration: 1000
        running: false
    }

    NumberAnimation {
        id:blueextend
        target:blueRect
        property:"width"
        to:root.height*2
        duration: 2000
        running: false
    }

    NumberAnimation {
        id:redextend
        target:redRect
        property:"width"
        to:root.height*2
        duration: 3000
        running: false
    }





    NumberAnimation {
        id:greenextend
        target:greenRect
        property:"width"
        to:root.height*2
        duration: 4000
        running: false
        onStopped: allopacitys.start()
    }
    NumberAnimation {
        id:allopacitys
        targets:[greenRect,redRect,blueRect,yellowRect]
        property:"opacity"
        to:0
        duration: 3000
        running: false
        onStopped: root.finished()

    }


    Rectangle {
        id: blueRect
        x:xposition - 100
        y:yposition - 100

        width: circleSize
        height: width
        color:"#2196F3"
        antialiasing: true
        radius: width/2

    }

    Rectangle {
        id: redRect
        x:xposition - 50
        y:yposition -50

        width: circleSize/2
        height: width
        color:"#F44336"
        antialiasing: true
        radius: width/2



    }


    Rectangle {
        id: greenRect
        x:xposition -25
        y:yposition -25

        width: circleSize/3
        height: width
        color:"#4CAF50"
        antialiasing: true
        radius: width/2



    }
}

