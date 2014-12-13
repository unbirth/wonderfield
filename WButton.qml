import QtQuick 2.0
import QtQuick.Controls 1.0
import com.me.qmlcomponents 1.0

Rectangle
{
    id: container

    NumberAnimation on opacity {
           id: showAnimation
           to: 1
           duration: 500
       }

    NumberAnimation on opacity {
           id: hideAnimation
           to: 0
           duration: 500
       }

        property string text: "Button"
        signal clicked
        signal appeared
        signal hide


        width: 40; height: 40
        smooth: true
        radius: 3
        color: "white"
        opacity: 1

        onHide:
        {
            hideAnimation.start();
        }

        onAppeared:
        {
            showAnimation.start();
        }

        MouseArea  {
            id: mouseArea
            anchors.fill: parent

            onClicked:
            {
                if (bonusPlus)
                {
                    pleaseChooseBox.visible = true;
                }
                else
                {
                    if (wasRotated == true)
                    {
                        container.clicked();
                        container.enabled = false;
                        hideAnimation.start();

                        if(multiplier != 8)
                        {
                            if(myGame.guessLetter(text, multiplier))
                            {
                                letterGuessed()
                            }
                        }


                        wasRotated = false;
                    }

                    else
                    {
                        pleaseRoll.visible = true;
                    }
                }
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
