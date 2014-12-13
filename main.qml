import QtQuick 2.0
import QtQuick.Controls 1.0
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

    //opacity: 1
    title: qsTr("WonderField")

    property int multiplier: 0
    property int sector: 0
    property int wordsInRow:    0
    property bool wasRotated: false
    property bool bonusPlus: false
    property string alph: "абвгдеёжзийклмнопрстуфхцчшщьыъэюя"
    property string player: "аноним"
    signal newGame
    signal letterGuessed
    signal textDialogLoaded

    FontLoader { id: uniOne; source: "qrc:/res/fonts/uni.otf" }
    FontLoader { id: uniTwo; source: "qrc:/res/fonts/uni2.otf" }

    MyGame
    {
        id: myGame
    }

    TextDialog
    {
        id:     hello
        message: "привет! меня зовут"
        buttonText: "вот так"
        visible: false;


        onButtonOkClicked:
        {
            if (inputText != "")
            {
                player = hello.inputText;
                playerNameText.text = qsTr("барабанокрутильщик-профессионал: " + player)
                mainMenu.visible = false;
                gameScreen.visible = true;
                gameQuestion.text = myGame.getQuestion()
            }
        }
        z: 10
    }



    Notification
    {
        id:     pleaseRoll;
        message: "Крутите, пожалуйста, барабан!";
        buttonText: "Ой, сейчас!"
        visible: false;
        z: 10;
    }

    Notification
    {
        id:     pleaseChoose;
        message: "Выберите, пожалуйста, букву!";
        buttonText: "Да-да!"
        visible: false;
        z: 10;
    }

    Notification
    {
        id:     pleaseChooseBox;
        message: "Выберите, пожалуйста, клетку!";
        buttonText: "Сию минуту!"
        visible: false;
        z: 10;
    }

    onNewGame:
    {
        myGame.resetGame();
        gameQuestion.text = myGame.getQuestion()
        gameAnswer.x = 403 - (myGame.getLength() / 2) * 40 - ((myGame.getLength() - 1) / 2) * 22;

        for(var i = 0; i < 33; i++)
        {
            alphabet.children[i].enabled = true;
            alphabet.children[i].appeared();
        }

        gameAnswer.columns = myGame.getLength()
        updateLetters()
    }

    MainMenu
    {
        id: mainMenu
        z:  0  

        Rectangle
        {
            id: startGameButton
            x: 50
            y: 275
            width: 390
            height: 125

            color:      "transparent"
            border.width: 3
            border.color: "white"
            radius:         5

            Text {
                id: startButtonText
                text: "Старт"

                anchors.fill: parent

                font.family: uniTwo.name
                color:  "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 48
            }

            MouseArea
            {
                id: startMouseArea
                anchors.fill: parent
                onClicked:
                {
                    hello.visible = true;
                    hello.windowLoaded();
                }
            }
        }

        Rectangle
        {
            id: exitButton
            x: 50
            y: 439
            width: 390
            height: 125

            color:      "transparent"
            border.width: 3
            border.color: "white"
            radius:         5

            Text {
                id: exitButtonText
                text: "Выход"

                anchors.fill: parent

                font.family: uniTwo.name
                color:  "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 48
            }

            MouseArea
            {
                id: exitMouseArea
                anchors.fill: parent
                onClicked:
                {
                    close()
                }
            }
        }
    }

    DialogWindow
    {
        id:             dialogWindow
        x:              0
        y:              0
        z:              10

        visible:        false
        backHeight:     mainWindow.height
        backWidth:      mainWindow.width

        onButtonOkClicked:
        {
            newGame()
            dialogWindow.visible = false;
            alphabet.enabled = true
        }
        onButtonCancelClicked:
        {
            //myGame.checkRecord()
            mainWindow.close()
        }
    }

    function updateLetters()
    {
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

        pointsLabelText.text = myGame.getPoints()

        if(myGame.checkWord())
        {
            //newGame()
            alphabet.enabled = false
            dialogWindow.dialogMessage = "Поздравляем, вы победили! Ваш приз - " + myGame.getPrize();
            dialogWindow.visible = true
            wordsInRow++;
        }
    }


    Item
    {
        id: gameScreen
        visible: false

        Settings
        {
            id: settingsPanel
            x:  -200
            y:  0
            z:  10
            onButtonExitClicked:
            {
                myGame.saveGame();
                close();
            }
        }

        AboutWindow
        {
            z: 10
            visible: false
            id: aboutWindow
        }

        TextDialog
        {
            id:     nameWord
            message: "Назовите, пожалуйста, слово:"
            buttonText: "Как-то так"
            visible: false;
            onButtonOkClicked:
            {
                if(myGame.guessWord(nameWord.inputText) != 0)
                {
                    myGame.setPoints(myGame.getPoints() + myGame.guessWord(nameWord.inputText))
                    alphabet.enabled = false
                    dialogWindow.dialogMessage = "Поздравляем, вы победили! Ваш приз - " + myGame.getPrize();
                    dialogWindow.visible = true
                    wordsInRow++;
                }

                else
                {
                    pleaseRoll.visible = true;
                }
            }
            z: 10
        }

        Image {
            id: gameBackground
            x: 0
            y: 0
            width: 800
            height: 600
            source: "qrc:/res/pictures/w_background.png"
        }

        Rectangle
        {
            id: pointsLabel

            width:  100
            height: 35

            x:  785 - width
            y:  35

            color:  "transparent"
            Text {
                id: pointsLabelText
                text: qsTr("0")
                anchors.fill: parent
                font.family: uniOne.name
                color:  "white"
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 100
                onTextChanged:
                {
                    if(pointsLabelText.text * 1 > highScoreLabelText.text * 1)
                    {
                        highScoreLabelText.text = pointsLabelText.text
                        highScorePlayerText.text = player
                        myGame.saveGame()
                    }
                }
            }
        }

        Rectangle
        {
            id: pointsLabelName

            width:  100
            height: 35

            x:  785 - width
            y:  5

            color:  "transparent"
            Text {
                id: pointsLabelNameText
                text: qsTr("Очки")
                anchors.fill: parent
                font.family: uniOne.name
                color:  "white"
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 100
                onTextChanged:
                {
                    if(pointsLabelText.text * 1 > highScoreLabelText.text * 1)
                    {
                        highScoreLabelText.text = pointsLabelText.text
                    }
                }
            }
        }


        Rectangle
        {
            id: highScoreLabel

            width:  100
            height: 35

            x:  15
            y:  35

            color:  "transparent"
            Text {
                id: highScoreLabelText
                text: myGame.getHighScore()
                anchors.fill: parent
                font.family: uniOne.name
                color:  "white"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 100
            }
        }

        Rectangle
        {
            id: highScoreNameLabel

            width:  100
            height: 35

            x:  15
            y:  5

            color:  "transparent"
            Text {
                id: highScoreNameLabelText
                text: "рекорд"
                anchors.fill: parent
                font.family: uniOne.name
                color:  "white"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 100
            }
        }

        Rectangle
        {
            id: highScorePlayer

            width:  100
            height: 35

            x:  15
            y:  55

            color:  "transparent"
            Text {
                id: highScorePlayerText
                text: myGame.getHighScoreName()
                anchors.fill: parent
                font.family: uniOne.name
                color:  "white"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignBottom
                fontSizeMode: Text.Fit
                font.pointSize: 12
            }
        }

        HelpWindow
        {
           id: helpWindow
           visible: false
           z: 10
        }

        Grid {
                id: gameAnswer
                x: 403 - (myGame.getLength() / 2) * 40 - ((myGame.getLength() - 1) / 2) * 22; y: 320
                z: 2
                rows: 1; columns: myGame.getLength(); spacing: 22

                WTextField{ number: 0 }
                WTextField{ number: 1 }
                WTextField{ number: 2 }
                WTextField{ number: 3 }
                WTextField{ number: 4 }
                WTextField{ number: 5 }
                WTextField{ number: 6 }
                WTextField{ number: 7 }
                WTextField{ number: 8 }
                WTextField{ number: 9 }
                WTextField{ number: 10 }
                WTextField{ number: 11 }
                WTextField{ number: 12 }


            }


        Rectangle
        {
            z: 1
            x: 36
            y: 180
            width: 740
            height: 115

            color: "transparent"
            radius: 5
            border.width: 3
            border.color: "white"


            Text
            {
                id: gameQuestion
                z:  2
                anchors.centerIn: parent
                width: parent.width - 4;
                height: parent.height - 4

                text: ("")
                color: "white"

                wrapMode: Text.WordWrap
                font.family: uniTwo.name

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                fontSizeMode: Text.Fit
                font.pointSize: 100

            }
        }


        Grid {
                id: alphabet
                x: 73
                y: 385
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

        Rectangle
        {
            id: playerName

            width:  760
            height: 35

            x:  400 - width / 2
            y:  560

            color:  "transparent"
            Text {
                id: playerNameText
                anchors.fill: parent
                font.family: uniOne.name
                color:  "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                fontSizeMode: Text.Fit
                font.pointSize: 100
            }
        }

        Image {
            id: gameBaraban
            x: 50
            y: -550
            z: 1
            width: 700
            height: 700
            source: "qrc:/res/pictures/w_bar.png"

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
                    if(!wasRotated)
                    {
                        rotateBaraban.start();
                    }
                    else if (!bonusPlus)
                    {
                        pleaseChoose.visible = true;
                    }
                    else if (bonusPlus)
                    {
                        pleaseChooseBox.visible = true;
                    }

                }
            }
            ParallelAnimation {
                id: rotateBaraban
                NumberAnimation {
                    target: gameBaraban;
                    properties: "rotation";
                    duration: 3000 + Math.random()*2000; easing.type: Easing.InOutQuad;
                    to: gameBaraban.rotation + 700 + Math.random()*360}
                onStopped:
                {
                    sector = Math.floor((gameBaraban.rotation % 360)/ 30);

                    switch(sector)
                    {
                    case 0:
                        console.log("100");
                        multiplier = 100;
                        break;
                    case 1:
                        console.log("x3");
                        multiplier = 3;
                        break;
                    case 2:
                        console.log("500");
                        multiplier = 500;
                        break;
                    case 3:
                        console.log("0");
                        multiplier = 0;
                        break;
                    case 4:
                        console.log("200");
                        multiplier = 200;
                        break;
                    case 5:
                        console.log("600");
                        multiplier = 600;
                        break;
                    case 6:
                        console.log("x5");
                        multiplier = 5;
                        break;
                    case 7:
                        console.log("400");
                        multiplier = 400;
                        break;
                    case 8:
                        console.log("+1");
                        multiplier = 0;
                        bonusPlus = true;
                        break;
                    case 9:
                        console.log("Б");
                        myGame.setPoints(0);
                        updateLetters();
                        break;
                    case 10:
                        console.log("x2");
                        multiplier = 2;
                        break;
                    case 11:
                        console.log("900");
                        multiplier = 900;
                        break;
                    }
                    if (sector != 9) wasRotated = true
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
            source: "qrc:/res/pictures/w_pointer.png"
        }
    }
}
