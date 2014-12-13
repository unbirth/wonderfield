import QtQuick 2.0

Rectangle {
    width: 800
    height: 600
    z: 0
    id: container
    color:  "transparent"

    Image {
        id: helpFirst
        z:  5
        source: "w_help1.png"
        anchors.fill: parent
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                helpFirst.visible = false;
            }
        }
    }

    Image {
        id: helpSecond
        z:  4
        source: "w_help2.png"
        anchors.fill: parent
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                helpSecond.visible = false;
            }
        }
    }

    Image {
        id: helpThird
        z:  3
        source: "w_help3.png"
        anchors.fill: parent
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                helpThird.visible = false;
            }
        }
    }

    Image {
        id: helpFourth
        z:  2
        source: "w_help4.png"
        anchors.fill: parent
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                helpFourth.visible = false;
            }
        }
    }

    Image {
        id: helpFifth
        z:  1
        source: "w_help5.png"
        anchors.fill: parent
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                container.visible = false;
                helpFirst.visible = true;
                helpSecond.visible = true;
                helpThird.visible = true;
                helpFourth.visible = true;
                helpFifth.visible = true;
            }
        }
    }
}
