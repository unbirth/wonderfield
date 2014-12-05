import QtQuick 2.0
import QtQuick.Controls 1.0
import com.me.qmlcomponents 1.0

Rectangle
{
    property string text: " "
    property int number: 0
    signal clicked;
    id: container
    width: 40; height: 40
    smooth: true
    radius: 3
    color: "white"
    opacity: 0.95

    Text
    {
        id: label
        visible: true
        text: container.text
        color: "#3d6576"
        font.family: uniOne.name
        font.pointSize: 20
        anchors.centerIn: container
    }
    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        onClicked:
        {
            container.clicked();
            if(bonusPlus)
            {
                bonusPlus = false;
                wasRotated = false;
                myGame.guessLetter(myGame.getAnswer()[number], 100);
                alphabet.enabled = true;
                updateLetters();
            }

        }
    }
}
