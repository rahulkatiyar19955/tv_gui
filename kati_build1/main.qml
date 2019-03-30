import QtQuick 2.7
import QtQuick.Window 2.2
import QtMultimedia 5.6
import QtGraphicalEffects 1.0

Window {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Kati OS")

    BorderImage {
        id: borderImage
        anchors.fill: parent
        source: "wall1.jpg"

        Item {
            id: element
            x: 60
            y: 402
            width: 538
            height: 302

            Image {
                id: image
                anchors.fill: parent
                source: "output-onlinepngtools.png"
                fillMode: Image.PreserveAspectFit
            }

            DropShadow {
                color: qsTr("#000000")
                radius: 11.3
                fast: false
                verticalOffset: 3
                horizontalOffset: 3.9
                spread: 0
                samples: 24

                source: image

            }


        }

    }
}



































/*##^## Designer {
    D{i:3;anchors_height:228;anchors_width:258;anchors_x:"-480";anchors_y:52}D{i:1;anchors_height:100;anchors_width:100;anchors_x:475;anchors_y:379}
}
 ##^##*/
