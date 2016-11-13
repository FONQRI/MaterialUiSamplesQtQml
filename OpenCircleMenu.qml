import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Window 2.0

Item{
    anchors.fill: parent
    property bool button_menu: true
    property bool openning: false
signal finished()

    id:root


    Rectangle {
        id: button
        width: 100
        height: width
        color: '#EEFF41'
        radius: width/2
        x:-30
        y: x



//        DropShadow {
//            id: buttonShadow
//            anchors.fill: button
//            cached: true
//            radius: 8
//            samples: 16
//            color: "#80000000"
//            smooth: false
//            source: button
//        }
        MouseArea {
            anchors.fill: parent
            onPressed:
            {
                if(button_menu && !(option1Opacityshow.running) && !(option1Opacityhide.running))
                {
                    openning=true
                    sizeincracor.start()
                    positionsetorbutton.start()
                    option1Opacityshow.start()
                    openning=false
                    button_menu=false
                }
                else if(!button_menu&& !(option1Opacityshow.running) && !(option1Opacityhide.running))
                {
                    openning=true

                    sizedecrasor.start()
                    positionsetormenu.start()
                    option1Opacityhide.start()
                    button_menu=true
                    openning=false

                }

         //   }

        }
    }

    SequentialAnimation {
        id: sizeincracor
        running: false
        NumberAnimation { target: button; property: "width"; to: root.height*3; duration: 1500}

    }

    SequentialAnimation {
        id: positionsetorbutton
        running: false
        NumberAnimation { target: button; property: "x"; to: - root.height*1.5; duration: 1500}

    }

    SequentialAnimation {
        id: sizedecrasor
        running: false
        NumberAnimation { target: button; property: "width"; to: 100; duration: 1500}

    }

    SequentialAnimation {
        id: positionsetormenu
        running: false
        NumberAnimation { target: button; property: "x"; to: -30; duration: 1500}

    }

    SequentialAnimation {
        id: option1Opacityshow
        running: false
        NumberAnimation { target: option1; property: "x"; to: root.width/2 -50; duration: 500}
        NumberAnimation { target: option2; property: "x"; to: root.width/2 -50; duration: 500}
        NumberAnimation { target: option3; property: "x"; to: root.width/2 -50; duration: 500}

    }

    SequentialAnimation {
        id: option1Opacityhide
        running: false
        NumberAnimation { target: option3; property: "x"; to:-100; duration: 500}
        NumberAnimation { target: option2; property: "x"; to: -100; duration: 500}
        NumberAnimation { target: option1; property: "x"; to:-100; duration: 500}

    }
}


Text{
    id:option1
    text: "First Option "
    opacity: 1

    width:100
    height: 50
    x: -100
    y:(root.height/10)*2
    MouseArea{
        anchors.fill: parent
        onClicked: finished()
    }
}

Text{
    id:option2
    text: "Second Option "
    opacity: 1

    width:100
    height: 50
    x:-100
    y:(root.height/10)*5



}

Text{
    id:option3
    text: "Thered Option "
    opacity: 1

    width:100
    height: 50
    x:-100
    y:(root.height/10)*8



}


}

