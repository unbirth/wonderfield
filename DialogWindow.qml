import QtQuick 2.0
import QtQuick.Controls 1.0
import com.me.qmlcomponents 1.0

Rectangle {

    id: dialogWindow
    property    int     distance:           75
    property    int     backWidth:          800
    property    int     backHeight:         600

    property    string  dialogMessage:          "Ваш приз - "

    signal              buttonOkClicked
    signal              buttonCancelClicked



    Rectangle
    {
        id:         dialogBackground
        color:      "black"
        z:          3
        width:      backWidth
        height:     backHeight
        opacity:    0.8
    }

    Rectangle
    {
        id: textAndButtons

        x:  backWidth / 2 - width / 2
        y:  backHeight / 2 - height / 2
        z:  4

        width:  backWidth / 3 * 2
        height: backHeight / 3

        color:  "transparent"
        border.width: 3
        border.color: "white"
        radius:       5

        Rectangle
        {
            id:         dialogTextBackground

            x:          15
            y:          25

            width:      parent.width - 50
            height:     80

            color:      "transparent"
            Text {
                id: dialogText
                text: dialogMessage
                anchors.fill: parent

                font.family: uniTwo.name
                color:  "white"
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 100
            }
        }

        Rectangle
        {
            id: dialogYesBackground
            x:          50
            y:          parent.height - height - 25

            height:     50
            width:      parent.width / 2 - 100

            color:      "transparent"
            border.width: 3
            border.color: "white"
            radius:         5
            Rectangle
            {
                anchors.centerIn: parent
                x: 0
                y: 0
                width: parent.width - 24
                height: parent.height - 24

                color: "transparent"

                Text {
                    id: dialogYes
                    text: qsTr("Забрать приз")

                    anchors.fill: parent

                    font.family: uniTwo.name
                    color:  "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.Fit
                    font.pointSize: 100
                }
            }
            MouseArea
            {
                id: yesMouseArea
                anchors.fill: parent
                onClicked:
                {
                    buttonOkClicked()
                }
            }
        }

        Rectangle
        {
            id: dialogNoBackground
            x:          parent.width - width - 50
            y:          parent.height - height - 25

            height:     50
            width:      parent.width / 2 - 100

            color:      "transparent"
            border.width: 3
            border.color: "white"
            radius:         5
            Rectangle
            {
                anchors.centerIn: parent
                x: 0
                y: 0
                width: parent.width - 24
                height: parent.height - 24

                color: "transparent"

                Text {
                    id: dialogNo
                    text: qsTr("ой, всё")

                    anchors.fill: parent

                    font.family: uniTwo.name
                    color:  "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.Fit
                    font.pointSize: 100
                }
            }
            MouseArea
            {
                id: noMouseArea
                anchors.fill: parent
                onClicked:
                {
                    myGame.addRecord(player, myGame.getPoints());
                    buttonCancelClicked()
                }
            }
        }
    }


}

