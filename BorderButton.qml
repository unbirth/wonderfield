import QtQuick 2.0

Rectangle
{
    signal              buttonClicked
    property    string  buttonText:     "проверочка"

    height:     50
    width:      125

    z:          0


    id:         buttonBackground
    color:      "transparent"

    border.width:   3
    border.color:   "white"
    radius:         5

    Rectangle
    {
        anchors.centerIn:   parent

        width: parent.width - 24
        height: parent.height - 24

        z:  1

        color: "transparent"

        Text {
            opacity: 1
            z:  2
            text: buttonText
            anchors.fill: parent
            font.family: uniTwo.name
            color:  "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            wrapMode: Text.WordWrap
            font.pointSize: 100
        }


    }

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        onClicked:
        {
            buttonClicked()
        }
    }

}
