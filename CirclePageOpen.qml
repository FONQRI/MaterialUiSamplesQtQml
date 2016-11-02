import QtQuick 2.7
import QtQuick.Controls.Material 2.0
Rectangle{
    property int virtualxRect: (parent.height*2 -parent.width)/2
    property int  virtualyRect:parent.height/2
    id:mainRect
    function start()
    {
        sizeAnim.start()
        opacityAnimchild.start()


    }

    anchors.centerIn: parent
    width:0
    height: width
    radius: height

    color:Material.color(Material.Blue)
    clip:true


    //        Rectangle{
    //            visible: true
    //            x:virtualxRect
    //            y:vitrualyRect
    //            width: 200
    //            height:200
    //            color:Material.color(Material.Green)
    //            MouseArea {
    //                anchors.fill: parent
    //                onClicked:
    //                {
    //                    sizeAnim.start()
    //                    opacityAnimchild.start()
    //                    opacityAnimrect.start()

    //                }
    //            }
    //        }




    //animations
    NumberAnimation {
        id: sizeAnim
        running:false
        from: 0
        to:parent.height*2
        property: "width"
        duration: 2000
        easing.type: Easing.InOutQuad
        target: mainRect
    }

    NumberAnimation {
        id: opacityAnimchild
        running:false
        from: 0
        to: 1
        property: "opacity"
        duration:3000
        easing.type: Easing.InOutQuad
        targets:mainRect.children
    }





}
