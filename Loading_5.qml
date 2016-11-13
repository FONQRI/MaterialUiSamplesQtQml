import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQml 2.2
Item {
    anchors.fill: parent
    id:root

    property int xposition: (root.height/2 - width)*2
    property int yposition:(root.height/2 - width)*2
    property int circleSize: 50
    property int speed: 5000
    property bool isrunning: false
    signal finished()


    function start(){
        firstAnim.start()

        startSecond.start()

        startthered.start()

        isrunning=true
    }
    function stop(){
        firstAnim.stop()
        secondAnim.stop()
        theredAnim.stop()

    }

    Timer{
        id:startSecond
        running: false
        interval: 500
        onTriggered: secondAnim.start()
    }

    Timer{
        id:startthered
        running: false
        interval: 1000
        onTriggered:  theredAnim.start()
    }

    Rectangle{
        anchors.fill: parent
        id:backgroundRect
        color:"white"


        Rectangle{
            id:first
            color:"#2196F3"
            width: root.width/7
            height: width
            radius: width/2
            x:(root.width/7)*1.5
            y:(root.height/2 - width)*2

            //Animation
            SequentialAnimation {
                running: false
                loops: -1
                id: firstAnim
                alwaysRunToEnd: true

                NumberAnimation{
                    target: first
                    property: "y"
                    to: first.y -8*(root.height/10)
                    duration: speed


                }

                NumberAnimation{
                    target: first

                    property: "y"
                    to:first.y
                    duration: speed

                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if(isrunning)
                        stop()
                    else
                        start()
                }
            }
        }


        // second Rectangle **************************************

        Rectangle{
            id:second
            color:"#2196F3"
            width: root.width/7
            height: width
            radius: width/2
            x:(root.width/7)*3
            y:(root.height/2 - width)*2

            SequentialAnimation {
                running: false
                loops: -1
                id: secondAnim
                alwaysRunToEnd: true

                NumberAnimation{
                    target: second
                    property: "y"
                    to: second.y -8*(root.height/10)
                    duration: speed


                }


                NumberAnimation{
                    target: second

                    property: "y"
                    to:second.y
                    duration: speed
                    //easing.type:Easing.OutBounce

                }

            }






        }


        //thered Rectangle *********************************************
        Rectangle{
            id:thered
            color:"#2196F3"
            width: root.width/7
            height: width
            radius: width/2
            x:(root.width/7)*4.5
            y:(root.height/2 - width)*2


            SequentialAnimation {
                running: false
                loops: -1
                id: theredAnim
                alwaysRunToEnd: true

                NumberAnimation{
                    target: thered
                    property: "y"
                    to: thered.y -8*(root.height/10)
                    duration: speed


                }


                NumberAnimation{
                    target: thered
                    property: "y"
                    to:thered.y
                    duration: speed
                    //easing.type:Easing.OutBounce

                }
                onStopped: {

                    finalAnimFirst.start()
                    finalAnimSecond.start()
                    finalAnimThered.start()
                }

            }





        }
        SequentialAnimation {
            running: false
            id: finalAnimFirst
            alwaysRunToEnd: true

            PathAnimation {

                duration: 5000
                easing.type: Easing.InQuad

                target: first
                // orientation: PathAnimation.RightFirst
                path:Path {

                    PathArc {
                        x: root.width/2 - first.width/2
                        y: root.height/2 - first.height/2
                        radiusX: 100
                        radiusY: 100
                        useLargeArc: true
                    }
                }
            }

        }

        SequentialAnimation {
            running: false
            id: finalAnimThered
            alwaysRunToEnd: true
            onStopped: finished()
            PathAnimation {

                duration: 5000
                easing.type: Easing.InQuad

                target: thered
                // orientation: PathAnimation.RightFirst
                path:Path {

                    PathArc {
                        x: root.width/2 - first.width/2
                        y: root.height/2 - first.height/2
                        radiusX: 100
                        radiusY: 100
                        useLargeArc: true
                        direction: PathArc.Counterclockwise
                    }
                }
            }

        }

        NumberAnimation{
            id:finalAnimSecond
            running: false
            target: second
            duration: 5000
            property: "y"
            to:root.height/2 - first.height/2
            onStopped: {
                finishAll.start()
            }
        }

        SequentialAnimation {
            running: false
            id: finishAll
            alwaysRunToEnd: true
            NumberAnimation {
                target: second
                running: false
                property: "width"
                to:root.height*2
                duration: 2500
                easing.type: Easing.InOutQuad

            }
            NumberAnimation{
                target: first
                running: false
                property: "opacity"
                to:0
                duration: 10

            }

            NumberAnimation{
                target: thered
                running: false
                property: "opacity"
                to:0
                duration: 10

            }
            NumberAnimation{
                target: second
                running: false
                property: "opacity"
                to:0
                duration: 2500

            }
            onStarted: second.anchors.centerIn=backgroundRect
        }
    }
}
