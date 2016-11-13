import QtQuick 2.7

Item {
    anchors.fill: parent
    id:root
    signal finished()


    Rectangle{
        anchors.fill: parent
        color:"#2196F3"

    }
    Rectangle{
        anchors.centerIn: parent
        id:backRect
        color:"#FFEB3B"
        width: 0
        height: width
        radius: width/2
        NumberAnimation {
            id:backgroundAnim
            target: backRect
            property:"width"
            from:0
            to:root.height*2
            duration: 2000
            running: false
        }
        NumberAnimation {
            id:opacityAnim
            target: backRect
            property:"opacity"
            from:0
            to:1
            duration: 2000
            running: false
        }
    }

    Rectangle{
        anchors.fill: parent
        color:"transparent"

        Rectangle{
            id:but
            visible: true
            x: root.width/2 - width/2
            y: 50
            width: 200
            height:50
            radius: width/2
            opacity: 0
            color: "#FF5722"
            NumberAnimation {
                id:opacityAnimButton
                target: but
                property:"opacity"
                from:0
                to:1
                duration: 3500
                running: false
                onStopped: finished()
            }

        }

    }
    MouseArea{
        anchors.fill: parent
        onClicked:{
            opacityAnim.start()
            backgroundAnim.start()
            opacityAnimButton.start()
        }
    }

}
