import QtQuick 2.7
Item {
    id: root

    property int virtualxRect: (root.height*2 -root.width)/2
    property int  virtualyRect:root.height/2
    anchors.fill: parent
    MouseArea{
        anchors.fill: root
        onClicked: start()
    }


    function start()
    {
        sizeAnim.start()
        opacityAnimchild.start()


    }
signal finished()


    Rectangle{
        id:mainRect
        anchors.centerIn: parent
        width:0
        height: width
        radius: height

        color:"#2196F3"
        clip:true
        //        ColorAnimation on color{
        //            from:"#2196F3"
        //            to: "#FF5722"
        //            duration: 5000
        //            running: true
        //        }


        Rectangle{
            visible: true
            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)

            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Loadding 1")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=l1

                }
            }
        }


        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*3
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Loading 2")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=l2

                }
            }
        }
        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*5
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Loading 3")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=l3

                }
            }
        }

        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*7
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Loading 4")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=l4

                }
            }
        }

        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*9
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Loading 5")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=l5

                }
            }
        }

        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*11
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Color Menu Change ")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=cmc

                }
            }
        }
        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*13
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("FloatPage ")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    //myload.sourceComponent=fp
                    console.log("comming soon...")

                }
            }
        }
        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*15
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Open Circle Menu ")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=ocm

                }
            }
        }

        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*17
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Switck Key 1")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=sk1

                }
            }
        }
        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*19
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Switck Key 2")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=sk2

                }
            }
        }

        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*21
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Switck Key 3")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=sk3

                }
            }
        }

        Rectangle{
            visible: true

            width: root.width/2
            height:(root.height/30)
            x:virtualxRect +root.width/2 - width/2
            y:virtualyRect + (root.height/30)*23
            radius: width/2
            color:"#FFEB3B"
            Text {
                anchors.centerIn: parent
                text: qsTr("Switck Key 4")
            }
            MouseArea {
                anchors.fill: parent
                onClicked:
                {
                    myload.sourceComponent=sk4

                }
            }
        }
        //animations
        NumberAnimation {
            id: sizeAnim
            running:true
            from: 0
            to:root.height*2
            property: "width"
            duration: 2000
            easing.type: Easing.InOutQuad
            target: mainRect
        }

        NumberAnimation {
            id: opacityAnimchild
            running:true
            from: 0
            to: 1
            property: "opacity"
            duration:3000
            easing.type: Easing.InOutQuad
            targets:mainRect.children
            //onStopped: root.finished()
        }
    }




}
