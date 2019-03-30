import QtQuick 2.7
import QtQuick.Window 2.2
import QtMultimedia 5.6
import QtGraphicalEffects 1.0


Window {
    id: window
    visible: true
    width: 1280
    height: 720
    property alias image3Z: image3.z
    property alias image2Z: image2.z
    property alias image1Z: image1.z
    property alias imageZ: image.z

    title: qsTr("Kati OS")

    Item {
        id: element
        anchors.fill: parent

        Rectangle {
            id: rectangle
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#49ccf1"
                }

                GradientStop {
                    position: 1
                    color: "#333f42"
                }
            }
            anchors.fill: parent
        }
    }


    Item {
        id: element1
        x: 255
        y: 48
        width: 671
        height: 34
        focus: true

        Rectangle {
            id: rectangle1
            color: "#646a84"
            radius: 26
            border.color: "#5b74b6"
            border.width: 4
            anchors.fill: parent

            TextInput {
                id: textInput
                x: 0
                y: 0
                text: qsTr("Search")
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
                font.family: "Verdana"
                font.bold: false
                leftPadding: 18
                topPadding: 2
                selectionColor: "#800000"
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 25
            }
        }

        Keys.onPressed: {
            //            if (event.key === Qt.Key_Down) {

            image.forceActiveFocus()
            //            }
        }
    }

    Item {
        id: time
        x: 1110
        y: 48
        width: 147
        height: 46

        Text {
            id: time_txt
            color: "#ed0d32"
            text: Qt.formatTime(new Date(),"hh:mm")
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 32
        }

        Timer {
            id: timer
            interval: 60000
            repeat: true
            running: true

            onTriggered:
            {
                time_txt.text =  Qt.formatTime(new Date(),"hh:mm")
            }
        }

    }

    Row {
        id: row
        x: 177
        y: 563
        width: 944
        height: 124
        spacing: 15

        Image {
            id: image
            width: 200
            height: 120
            scale: 1.0
            z: 1
            source: "movie_e.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea
                anchors.fill: parent
            }
            Keys.onLeftPressed: image3.forceActiveFocus()
            Keys.onRightPressed: image1.forceActiveFocus()
            Keys.onReturnPressed:
            {

            }
        }

        Image {
            id: image1
            width: 200
            height: 120
            z:1
            source: "sport_e.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea1
                anchors.fill: parent
            }
            Keys.onLeftPressed: image.forceActiveFocus()
            Keys.onRightPressed: image2.forceActiveFocus()
        }

        Image {
            id: image2
            width: 200
            height: 120
            z: 1
            source: "news_e.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea2
                anchors.fill: parent
            }
            Keys.onLeftPressed: image1.forceActiveFocus()
            Keys.onRightPressed: image3.forceActiveFocus()
            Keys.onReturnPressed: {
                pathView.visible = true
                pathView.forceActiveFocus()
                bottomRowHide.start()
            }
        }

        Image {
            id: image3
            width: 200
            height: 120
            z:1
            source: "music_e.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea3
                anchors.fill: parent
            }
            Keys.onLeftPressed: image2.forceActiveFocus()
            Keys.onRightPressed: image.forceActiveFocus()
        }

        Keys.onDigit0Pressed: Qt.quit()
    }

    Connections {
        target: mouseArea
        onClicked: {
            print("movie")
            //rectangle2visible = true
        }


    }

    Connections {
        target: mouseArea1
        onClicked: print("clicked")
    }


    Connections {
        target: mouseArea2
        onClicked: print("clicked")
    }

    Connections {
        target: mouseArea3
        onClicked: print("clicked")
    }

    Text {
        id: element2
        x: 50
        y: 30
        width: 64
        height: 32
        text: qsTr("EXIT")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18

        MouseArea {
            id: mouseArea4
            anchors.fill: parent
        }
    }

    Connections {
        target: mouseArea4
        onClicked: Qt.quit()
    }

    Connections {
        target: mouseArea
        onPressed: {

            ani1.start()
            v1.play()


        }

    }

    NumberAnimation {
        id: ani1
        target: v1
        property: "scale"
        from: 0.01
        to:1.0
        duration: 3000
        easing.type: Easing.InOutCubic
    }

    ParallelAnimation{
        id:bottomRowHide

        NumberAnimation{ target: row; property: "y"; to: 700; duration: 500 ;}
        NumberAnimation{ target: row; property: "scale" ; to: 0.1; duration: 500 ; }

    }
    ParallelAnimation{
        id:bottomRowShow

        NumberAnimation{ target: row; property: "y"; to: 563; duration: 500 ;}
        NumberAnimation{ target: row; property: "scale" ; to: 1.0; duration: 500 ; }

    }


    Text {
        id: element4
        x: 58
        y: 68
        width: 80
        height: 42
        text: v1.status
        font.pixelSize: 20
    }

    Connections {
        target: image
        onFocusChanged: {
            if(image.activeFocus == true)
            {
                image.scale = 1.2; image.z = 3

            }
            else
            {
                image.scale = 1.0; image.z = 1

            }
        }
    }

    Connections {
        target: image1
        onFocusChanged: {
            if(image1.activeFocus == true)
            {
                image1.scale = 1.2; image1.z = 3

            }
            else
            {
                image1.scale = 1.0; image1.z = 1

            }
        }
    }

    Video{
        id: v1
        x: 309
        y: 111
        width: 588
        height: 286
        transformOrigin: Item.TopLeft
        //anchors.fill: rectangle2
        Keys.onDownPressed: {
            v1.width = 588
            v1.height = 286
            v1.x = 309
            v1.y = 111
            v1.z = 1
            pathView.visible = true
            pathView.forceActiveFocus()

        }
        Keys.onRightPressed: {

            if(v1.volume<=0.9)
                v1.volume +=0.1
        }
        Keys.onLeftPressed: {

            if(v1.volume >=0.1)
            {
                v1.volume -=0.1
            }
        }

    }

    Connections {
        target: image2
        onFocusChanged: {
            if(image2.activeFocus == true)
            {
                image2.scale = 1.2; image2.z = 3

            }
            else
            {
                image2.scale = 1.0; image2.z = 1

            }
        }
    }


    Connections {
        target: image3
        onFocusChanged: {
            if(image3.activeFocus == true)
            {
                image3.scale = 1.2; image3.z = 3

            }
            else
            {
                image3.scale = 1.0; image3.z = 1

            }
        }
    }


    PathView {
        id: pathView
        x: 394
        y: 415
        width: 492
        height: 194
        dragMargin: 0
        focus: false
        visible: false
        pathItemCount: 6

        model: ListModel {
            ListElement {
                name: "Aaj Tak"
                colorCode: "grey"
            }

            ListElement {
                name: "other TV"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "India TV"
                colorCode: "green"
            }
        }
        path: Path {
            id: myPath
            startX: pathView.width*0.1
            startY: pathView.height/2

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }
            PathLine {
                x:pathView.width*0.4
                y: pathView.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 2
            }

            PathAttribute {
                name: "iconZ"
                value: 1000
            }

            PathLine {
                x:pathView.width*0.8
                y: pathView.height/2
            }

            PathAttribute {
                name: "iconScale"
                value: 1
            }

            PathAttribute {
                name: "iconZ"
                value: 0
            }
        }
        delegate: Item {
            id: element5
            width: 80
            height: 80
            scale: PathView.iconScale
            z: PathView.iconZ
            Rectangle {
                height: 60
                color: colorCode
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            Text {
                y: 60
                height: 20
                text: name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.bold: true
            }

        }
        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()
        Keys.onDownPressed: {bottomRowShow.start(); element1.forceActiveFocus(); pathView.visible = false ; }
        Keys.onUpPressed: {v1.width = window.width; v1.height = window.height; v1.x=0;v1.y=0;v1.z=10; pathView.visible = false; v1.forceActiveFocus() }
        Keys.onReturnPressed:
        {
            if(currentIndex == 0)
            {
                v1.source = "http://nicls1-lh.akamaihd.net/i/ddnews_1@409133/master.m3u8"
            }
            else if(currentIndex == 1)
            {
                v1.source = "http://indiatvnews-lh.akamaihd.net/i/ITV_1@199237/master.m3u8"
            }
            else if(currentIndex == 2)
            {
                v1.source = "http://nicls1-lh.akamaihd.net/i/ddnews_1@409133/master.m3u8"
            }
            else
            {
                v1.source = "http://nicls1-lh.akamaihd.net/i/ddnews_1@409133/master.m3u8"
            }
            textInput.text = currentIndex
            //rectangle2.visible = true
            ani1.start()
            v1.play()

        }
    }







}













































































































/*##^## Designer {
    D{i:2;anchors_height:200;anchors_width:200;anchors_x:215;anchors_y:145}D{i:1;anchors_height:200;anchors_width:200;anchors_x:337;anchors_y:249}
D{i:10;anchors_height:31;anchors_width:1073;anchors_x:97;anchors_y:85}D{i:11;anchors_height:31;anchors_width:77;anchors_x:1063;anchors_y:85}
D{i:9;anchors_width:1073;anchors_x:97}D{i:14;anchors_height:100;anchors_width:100}
D{i:16;anchors_height:100;anchors_width:100}D{i:15;anchors_height:100;anchors_width:100}
D{i:18;anchors_height:100;anchors_width:100}D{i:17;anchors_height:100;anchors_width:100}
D{i:20;anchors_height:100;anchors_width:100}D{i:19;anchors_height:100;anchors_width:100}
D{i:12;invisible:true}D{i:21;anchors_height:100;anchors_width:100}D{i:26;anchors_height:100;anchors_width:100}
D{i:27;anchors_height:100;anchors_width:100}
}
 ##^##*/
