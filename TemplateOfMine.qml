import QtQuick 2.0
//Canvas {
//    id: canvas
//    width: 256
//    height: 256

//    property bool arrowFormState: false
//    function toggle() { arrowFormState = !arrowFormState }

//    property real angle: 0
//    property real morphProgress: 0
//    states: State {
//        when: arrowFormState
//        PropertyChanges { angle: 180; target: canvas }
//        PropertyChanges { morphProgress: 1; target: canvas }
//    }
//    transitions: Transition {
//        RotationAnimation {
//            property: "angle"
//            direction: RotationAnimation.Clockwise
//            easing.type: Easing.InOutCubic
//            duration: 500
//        }
//        NumberAnimation {
//            property: "morphProgress"
//            easing.type: Easing.InOutCubic
//            duration: 500
//        }
//    }

//    onAngleChanged: requestPaint()
//    onMorphProgressChanged: requestPaint()

//    renderTarget: Canvas.FramebufferObject
//    renderStrategy: Canvas.Cooperative

//    onPaint: {
//        var ctx = getContext('2d')
//        // The context keeps its state between paint calls, reset the transform
//        ctx.resetTransform()

//        ctx.fillStyle = 'white'
//        ctx.fillRect(0, 0, width, height)

//        // Rotate from the center
//        ctx.translate(width / 2, height / 2)
//        ctx.rotate(angle * Math.PI / 180)
//        ctx.translate(-width / 2, -height / 2)

//        var left = width * 0.25
//        var right = width * 0.75
//        var vCenter = height * 0.5
//        var vDelta = height / 6

//        // Use our cubic-interpolated morphProgress to extract
//        // other animation parameter values
//        function interpolate(first, second, ratio) {
//            return first + (second - first) * ratio;
//        };
//        var vArrowEndDelta = interpolate(vDelta, vDelta * 1.25, morphProgress)
//        var vArrowTipDelta = interpolate(vDelta, 0, morphProgress)
//        var arrowEndX = interpolate(left, right - vArrowEndDelta, morphProgress)

//        ctx.lineCap = "square"
//        ctx.lineWidth = vDelta * 0.4
//        ctx.strokeStyle = 'black'
//        var lineCapAdjustment = interpolate(0, ctx.lineWidth / 2, morphProgress)

//        ctx.beginPath()
//        ctx.moveTo(arrowEndX, vCenter - vArrowEndDelta)
//        ctx.lineTo(right, vCenter - vArrowTipDelta)
//        ctx.moveTo(left + lineCapAdjustment, vCenter)
//        ctx.lineTo(right - lineCapAdjustment, vCenter)
//        ctx.moveTo(arrowEndX, vCenter + vArrowEndDelta)
//        ctx.lineTo(right, vCenter + vArrowTipDelta)
//        ctx.stroke()
//    }
//    Timer { repeat: true; running: true; onTriggered: toggle() }
//}
Rectangle{
    anchors.fill: parent
    color:"yellow"
Rectangle{

    color:"red"
    anchors{
        fill:parent
        centerIn: parent
        margins: 20
        topMargin: 10
        leftMargin: 10
        rightMargin: 10
        bottomMargin: 10
    }
}
}
