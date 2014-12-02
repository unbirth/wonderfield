import QtQuick 2.3
import QtQuick.Controls 1.2
import com.me.qmlcomponents 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    color: "white"
    minimumWidth: 800
    minimumHeight: 600
    maximumWidth: 800
    maximumHeight: 600
    width: 800
    height: 600

    opacity: 1
    title: qsTr("WonderField")

    property int multiplier: 0
    property bool wasRotated: false
    property string alph: "абвгдеёжзийклмнопрстуфхцчшщьыъэюя"

    signal newGame

    MyGame
    {
        id: myGame
    }

    onNewGame:
    {
        myGame.resetGame();
        gameQuestion.text = myGame.getQuestion()
        gameAnswer.x = 400 - (myGame.getLength() / 2) * 40

        for(var i = 0; i < 33; i++)
        {
            alphabet.children[i].enabled = true;
            alphabet.children[i].opacity = 100
        }

        gameAnswer.columns = myGame.getLength()
        updateLetters()

    }


    Item {
        id: mainMenu
        Button {
            id: startGameButton
            x: 82
            y: 275
            width: 390
            height: 125
            text: "Начать игру"
            onClicked:
            {
                mainMenu.visible = false; gameScreen.visible = true;
                gameQuestion.text = myGame.getQuestion()
            }
        }

        Button {
            id: exitButton
            x: 82
            y: 439
            width: 390
            height: 125
            text: "Выход"
            onClicked: close()
        }

        Image {
            id: rotatingBaraban
            x: 566
            y: -50
            width: 700
            height: 700
            sourceSize.width: 415
            source: "w_bar.png"
            smooth: true
            RotationAnimation on rotation {
                     loops: Animation.Infinite
                     from: 0
                     to: 360
                     //SmoothedAnimation: 1
                     duration: 10000
                 }
        }

        Image {
            id: gameLogo
            x: 30
            y: 30
            width: 494
            height: 194
            source: "w_logo.png"
        }



    }

    function updateLetters()
    {
        console.log("WORD: " + myGame.getAnswer() + "COLUMNS: " + gameAnswer.columns)
        for(var i = 0; i < 13; i++)
        {
           if( i < myGame.getLength())
           {
               gameAnswer.children[i].width = 40
               gameAnswer.children[i].text = myGame.getLetter(i)
           }
           else
           {
               gameAnswer.children[i].text = ""
               gameAnswer.children[i].width = 0
           }
        }
        if(myGame.checkWord())
        {
            newGame()
        }
    }


    Item
    {
        id: gameScreen
        visible: false

        Grid {
                id: gameAnswer
                x: 400 - (myGame.getLength() / 2) * 40; y: 370
                z: 2
                rows: 1; columns: myGame.getLength(); spacing: 1

                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
                WTextField{}
            }

        Text {
            id: gameQuestion
            x: 36
            y: 215
            width: 740
            height: 115
            text: ("")
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
            font.family: "Tahoma"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 17
        }



        Grid {
                id: alphabet
                x: 73
                y: 425
                rows: 3; columns: 11; spacing: 22;

                WButton{text: alph[0]}
                WButton{text: alph[1]}
                WButton{text: alph[2]}
                WButton{text: alph[3]}
                WButton{text: alph[4]}
                WButton{text: alph[5]}
                WButton{text: alph[6]}
                WButton{text: alph[7]}
                WButton{text: alph[8]}
                WButton{text: alph[9]}
                WButton{text: alph[10]}
                WButton{text: alph[11]}
                WButton{text: alph[12]}
                WButton{text: alph[13]}
                WButton{text: alph[14]}
                WButton{text: alph[15]}
                WButton{text: alph[16]}
                WButton{text: alph[17]}
                WButton{text: alph[18]}
                WButton{text: alph[19]}
                WButton{text: alph[20]}
                WButton{text: alph[21]}
                WButton{text: alph[22]}
                WButton{text: alph[23]}
                WButton{text: alph[24]}
                WButton{text: alph[25]}
                WButton{text: alph[26]}
                WButton{text: alph[27]}
                WButton{text: alph[28]}
                WButton{text: alph[29]}
                WButton{text: alph[30]}
                WButton{text: alph[31]}
                WButton{text: alph[32]}


            }

        Image {
            id: gameBaraban
            x: 50
            y: -550
            width: 700
            height: 700
            source: "w_bar.png"

            MouseArea
            {
                anchors.fill: parent
                id: mouseArea;
                x: 50
                y: -550
                width: 700
                height: 700
                onClicked:
                {
                    rotateBaraban.start();
                }
            }
            ParallelAnimation {
                id: rotateBaraban
                NumberAnimation { target: gameBaraban; properties: "rotation"; duration: 1000 + Math.random()*2000; easing.type: Easing.InOutQuad; to: gameBaraban.rotation + 500 + Math.random()*1200}
                onStopped:
                {
                    multiplier = gameBaraban.rotation % 360;
                    console.log(multiplier);
                    wasRotated = true
                }
            }
        }

        Image {
            id: pointer
            x: 385
            y: 117
            width: 30
            height: 60
            z: 1
            source: "w_pointer.png"
        }
    }
}
