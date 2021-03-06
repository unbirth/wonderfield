import QtQuick 2.0
import QtQuick.Controls 1.0
import com.me.qmlcomponents 1.0

Rectangle {

    id: notificationWindow
    property    string  message:            "Здесь могла быть ваша реклама"
    property    string  buttonText:         "А это надпись на кнопке"
    property    int     backWidth:          800
    property    int     backHeight:         600

    signal              buttonOkClicked


    Rectangle
    {
        id:         notificationWindowBackground
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
            id:         notificationTextBackground

            x:          25
            y:          25

            width:      parent.width - 50
            height:     100


            color:      "transparent"
            Text {
                id: notificationText
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
            id: notificationOkBackground
            x:          parent.width / 2 - width / 2
            y:          parent.height - height - 25

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
                    id: notificationOk
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
                MouseArea
                {
                    id: okMouseArea
                    anchors.fill: parent
                    onClicked:
                    {
                        buttonOkClicked()
                        notificationWindow.visible = false;
                    }
                }
            }
        }
    }
}

