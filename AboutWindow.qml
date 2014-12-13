import QtQuick 2.0

Rectangle {
    width: 800
    height: 600
    z: 0
    id: container
    color: "transparent"

    Image {
        id: helpFifth
        z:  1
        source: "qrc:/res/pictures/w_about.png"
        anchors.fill: parent
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                container.visible = false;
            }
        }
    }
}
