import QtQuick 2.0
import QtQuick.Controls 1.0
import com.me.qmlcomponents 1.0

Rectangle {

    id: textDialogWindow
    property    string  message:            "Здесь могла быть ваша реклама"
    property    string  buttonText:         "А это надпись на кнопке"
    property    int     backWidth:          800
    property    int     backHeight:         600

    signal              buttonOkClicked
    signal              textClicked

    Rectangle
    {
        id:         textDialogWindowBackground
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

        width:  400
        height: 200

        color:  "transparent"
        border.width: 3
        border.color: "white"
        radius:       5

        Rectangle
        {
            id:         textDialogTextBackground

            x:          25
            y:          25

            width:      parent.width - 50
            height:     50


            color:      "transparent"
            Text
            {
                id: textDialogText
                text: message
                anchors.fill: parent
                font.family: uniTwo.name
                color:  "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 100

            }
        }

        Rectangle
        {
            id:         textDialogInputBackground

            x:              25
            y:              80

            width:          parent.width - 50
            height:         50

            TextInput{
                anchors.fill: parent
                width: parent.width - 50
                id: textDialogInput
                font.family: uniTwo.name
                text: "ЖМИ СЮДА"
                color:  "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 20
                maximumLength: 14

                MouseArea
                {
                    id: textMouseArea
                    anchors.fill: parent
                    onClicked:
                    {
                        textClicked()
                        textDialogInput.text = ""
                        textDialogInput.forceActiveFocus()
                    }
                }
            }
            color:      "transparent"
        }

        Rectangle
        {
            id: textDialogOkBackground
            x:          parent.width / 2 - width / 2
            y:          parent.height - height - 15

            height:     50
            width:      parent.width / 2

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
                    id: textDialogOk
                    text: buttonText

                    anchors.fill: parent
                    x: 0

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
                id: okMouseArea
                x: 12
                y: 12
                anchors.fill: parent
                onClicked:
                {
                    player = textDialogInput.text
                    buttonOkClicked()
                    textDialogWindow.visible = false;
                }
            }
        }
    }
}

