
import QtQuick 2.7
import QtQuick.Controls 2.0
Item {
    anchors.fill: parent
    id:root
    property bool switchState: false
    property bool downAnim: true
    property int  times: 0
    signal finished()
    Rectangle{
        id:backgroundRect
        anchors.fill: parent
        color:"white"

        Rectangle{
            id:tempRect
anchors.centerIn: parent
width:0
height: width
radius: width/2
color:switchState?"#2196F3":"white"


NumberAnimation{
target: tempRect
id:changeBackground
alwaysRunToEnd: true
property:"width"
running: false
from:0
to :root.height*2
duration: 1400
onStopped:
{
    backgroundRect.color=switchState?"#2196F3":"white"
    tempRect.opacity=0
    downAnim=true

    times++
    if(times>3)
        finished()
}
}
        }
        Rectangle{
            id:subRect
            anchors.centerIn: parent
            width: (parent.width*2)/5
            height: (parent.height)/20
            radius: width/2
            color:"#2196F3"

            ColorAnimation on color{
                id:colorsubAnim
                alwaysRunToEnd: true

                running:false
                to: !switchState?"white":"#2196F3"
                duration: 500
            }



            Rectangle{
                id:switchKey
                x:0
                anchors.verticalCenter: parent.verticalCenter
                width: (backgroundRect.height*1.5)/20
                height: width
                radius: width/2
                color:"#FFEB3B"

                NumberAnimation{
                    id:moveAnimation
                    target:   switchKey
                    alwaysRunToEnd: true

                    property: "x"
                    to:!switchState?(subRect.width ) - switchKey.width :0
                    duration: 700
                }

                SequentialAnimation {
                    alwaysRunToEnd: true

                    running: false
                    id:changeSize
                    NumberAnimation{
                        target:   switchKey
                        property: "width"
                        to:!switchState? switchKey.width*1.5: switchKey.width/1.5
                        duration: 700
                    }


                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(switchState && downAnim){
                        downAnim=false
                    moveAnimation.start()
                    colorsubAnim.start()
                    changeSize.start()
                    tempRect.opacity=true
                    changeBackground.start()

                        switchState=false
                    }
                    else if(  !switchState &&downAnim)
                    {
                        downAnim=false

                        moveAnimation.start()
                        colorsubAnim.start()
                       changeSize.start()
                        tempRect.opacity=true
                        changeBackground.start()
                        switchState=true

                    }
                }
            }
        }
    }
}
