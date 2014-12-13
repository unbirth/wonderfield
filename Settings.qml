import QtQuick 2.0
import QtQuick.Controls 1.0
import com.me.qmlcomponents 1.0

Rectangle {

    id: settingsWindow
    property    bool    hidden:             true
    property    int     backWidth:          200
    property    int     backHeight:         600

    signal              buttonRiskClicked
    signal              buttonHelpClicked
    signal              buttonAboutClicked
    signal              buttonExitClicked
    signal              sideArrowClicked

    NumberAnimation on x {
           id: xHide
           to: -200
           duration: 500
       }

    NumberAnimation on x {
           id: xShow
           to: 0
           duration: 500
       }



    Rectangle
    {

        NumberAnimation on opacity {
               id: opacityHide
               to: 0.55
               duration: 500
           }
        NumberAnimation on opacity {
               id: opacityShow
               to: 0.9
               duration: 500
           }


        id:         settingsBackground
        color:      "black"
        z:          5
        opacity:    0.55
        width:      backWidth
        height:     backHeight
        Image {
            id: sideArrow
            source: "w_side.png"
            x:  backWidth
            y:  backHeight / 3 * 2 - height / 2
            MouseArea
            {
                id: sideArrowMouseArea
                anchors.fill: parent
                onClicked:
                {
                    sideArrowClicked()
                    if (hidden)
                    {
                        opacityShow.start()
                        xShow.start()
                    }
                    else
                    {
                        opacityHide.start()
                        xHide.start()
                    }
                    hidden = !hidden
                }
            }
        }
    }


    Text
    {
        id: menuText
        x:  100 - width / 2
        y:  30
        z:  7
        height: 50
        width: 150

        font.family: uniTwo.name
        text: qsTr("меню")

        color:  "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.HorizontalFit
        font.pointSize: 60
    }

    BorderButton
    {
        id:         risk
        x:          backWidth / 2 - width / 2
        y:          backHeight / 3 * 2 - height / 2 - height * 2 - 20
        z:          10
        width:      150
        buttonText: "рискнуть"
        onButtonClicked:
        {
            opacityHide.start()
            xHide.start()
            hidden = true;
            if(!wasRotated)
            {
                pleaseRoll.visible = true;
            }
            else
            {
                wasRotated = false;
                buttonRiskClicked()
                nameWord.visible = true;
                nameWord.windowLoaded();
            }
        }
    }
    BorderButton
    {
        id:         help
        x:          backWidth / 2 - width / 2
        y:          backHeight / 3 * 2 - height / 2 - height + 10
        z:          10
        width:      150
        buttonText: "помощь"
        onButtonClicked:
        {
            buttonHelpClicked()
            opacityHide.start()
            xHide.start()
            hidden = true;
            helpWindow.visible = true;
        }
    }
    BorderButton
    {
        id:         about
        x:          backWidth / 2 - width / 2
        y:          backHeight / 3 * 2 - height / 2 + height - 10
        z:          10
        width:      150
        buttonText: "об авторе"
        onButtonClicked:
        {
            buttonAboutClicked()
            opacityHide.start()
            xHide.start()
            hidden = true;
            aboutWindow.visible = true;
        }
    }
    BorderButton
    {
        id:         quit
        x:          backWidth / 2 - width / 2
        y:          backHeight / 3 * 2 - height / 2 + height * 2 + 20
        z:          10
        width:      150
        buttonText: "выход"
        onButtonClicked:
        {
            buttonQuitClicked()
            opacityHide.start()
            xHide.start()
            hidden = true;
        }
    }



}

