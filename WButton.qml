import QtQuick 2.3
import QtQuick.Controls 1.2
import com.me.qmlcomponents 1.0

Rectangle
{
    id: container

        property string text: "Button"

        signal clicked

        width: 40; height: 40
        smooth: true
        radius: 2
        color: "white"
        border
        {
            width: 2
            color: "#333333"
        }

        MouseArea  {
            id: mouseArea
            anchors.fill: parent

            onClicked:
            {
//                if (wasRotated == true)
//                {
                    container.clicked();
                    container.opacity = 0

                    container.enabled = false;

                    myGame.guessLetter(text, multiplier)
                    wasRotated = false;
//                }
                updateLetters();
            }

        }


        Text  {
            id: buttonLabel
            anchors.centerIn: container
            color: "#111111"
            text: container.text
            font.pixelSize: 20
        }

}
