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
        radius: 3
        color: "white"
        opacity: 0.95

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

                    if(multiplier != 8)
                        myGame.guessLetter(text, multiplier)

                    wasRotated = false;
//                }
                updateLetters();
            }

        }


        Text  {
            id: buttonLabel
            anchors.centerIn: container
            color: "#3b6b69"
            text: container.text
            font.pointSize: 20
            font.family: uniOne.name
        }

}
