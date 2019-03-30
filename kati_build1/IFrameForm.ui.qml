import QtQuick 2.4
import QtGraphicalEffects 1.0

Item {
    width: 240
    height: 320
    property alias source: image.source

    Image {
        id: image
        x: 88
        y: 29
        width: 100
        height: 100

        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        x: 41
        y: 147
        width: 100
        height: 100
        rotation: 45
        source: image.source
        fillMode: Image.PreserveAspectFit
    }
    FastBlur {
        source: image
        anchors.fill: image1
        radius: 35
        rotation: 45
    }
}
