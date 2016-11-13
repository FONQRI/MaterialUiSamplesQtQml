import QtQuick 2.0
Item {
    id: root
    signal finished()
anchors.fill: parent
 Canvas {
     id: mycanvas
     anchors.fill: parent
     onPaint: {
         var ctx = getContext("2d");
         ctx.fillStyle = Qt.rgba(30, 10, 60);
         ctx.fillRect(0, 0, width, height);
     }
 }
}
