import QtQuick 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0
Item {
    anchors.fill: parent
    id:root
    property bool isOpen: false
    Rectangle{
        id:rect
        visible: true
        color:Material.color(Material.Blue)
        x:- parent.height +20
        y: 0
        width:  parent.height
        height: parent.height
        radius: 10
        PropertyAnimation {
            id: openMenu
            running: false
            target: rect
            property: "x"
            to:- parent.height +20 + (root.width/5)*3
            duration: 1000
        }

        PropertyAnimation {
            id: closeMenu
            running: false
            target: rect
            property: "x"
            to: -root.height + 5
            duration: 1000
        }

        PropertyAnimation {
            id: radiusIncrasor
            running: false
            target: rect
            property: "radius"
            to: height
            duration: 2000
        }
        PropertyAnimation {
            id: radiusdecrasor
            running: false
            target: rect
            property: "radius"
            to: 0
            duration: 2000
        }
        MouseArea {
            anchors.fill: parent
            onClicked:
            {
                if(isOpen)
                {
                    //closeMenu.start()
                    radiusdecrasor.start()
                    isOpen=false;
                }
                else
                {
                    radiusIncrasor.start()
                    openMenu.start()
                    isOpen=true
                }

            }

        }

    }


}

