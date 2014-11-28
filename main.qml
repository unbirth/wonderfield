import QtQuick 2.3
import QtQuick.Controls 1.2
import com.me.qmlcomponents 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    color: "white"
    width: 640
    height: 480
    opacity: 1
    title: qsTr("WonderField")
    minimumHeight: height
    maximumHeight: height
    minimumWidth: width
    maximumWidth: width

    MyGame
    {
        id: myGame
    }

    Item {
        id: mainMenu
        Button {
            id: startGameButton
            x: 30
            y: 248
            width: 202
            height: 71
            text: "Начать игру"
            onClicked:
            {
                mainMenu.visible = false; gameScreen.visible = true;
               // myGame.resetGame()
                gameQuestion.text = myGame.getQuestion()
                //Start Game

            }
        }

        Button {
            id: exitButton
            x: 30
            y: 379
            width: 202
            height: 71
            text: "Выход"
            onClicked: close()
        }

        Image {
            id: rotatingBaraban
            x: 392
            y: -110
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
            width: 316
            height: 149
            source: "w_logo.png"
        }



    }

    Item
    {
        id: gameScreen
        visible: false


        Grid {
                id: gameAnswer
                x: 320 - (myGame.getLength() / 2) * 40; y: 200
                rows: 1; columns: myGame.getLength(); spacing: 1

                Repeater
                {
                    model: myGame.getLength();
                    Rectangle
                    {
                        width: 40;
                        height: 40
                        color: "lightgray"
                        Text
                        {
                            visible: false
                            text: myGame.getAnswer()[index]
                            font.pixelSize: 16
                            anchors.centerIn: parent
                        }
                    }
                }
            }

        Text {
            id: gameQuestion
            x: 30
            y: 30
            width: 580
            height: 116
            text: ("")
            wrapMode: Text.WordWrap
            font.family: "Tahoma"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 17
        }

        Item
        {
            id: alphabet
            x: 2
            antialiasing: false
            z: 0
            scale: 1
            Button {
                id: button1
                x: 66
                y: 329
                width: 40
                height: 40
                text: ("А")
                onClicked:
                {
                    visible = false;
                    myGame.checkLetter("а")
                }
            }

            Button {
                id: button2
                x: 112
                y: 329
                width: 40
                height: 40
                text: "Б"
                onClicked:
                {
                    visible = false;
                }
            }

            Button {
                id: button3
                x: 158
                y: 329
                width: 40
                height: 40
                text: "В"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button4
                x: 204
                y: 329
                width: 40
                height: 40
                text: "Г"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button5
                x: 250
                y: 329
                width: 40
                height: 40
                text: "Д"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button6
                x: 296
                y: 329
                width: 40
                height: 40
                text: "Е"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button7
                x: 342
                y: 329
                width: 40
                height: 40
                text: "Ж"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button8
                x: 388
                y: 329
                width: 40
                height: 40
                text: "З"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button9
                x: 434
                y: 329
                width: 40
                height: 40
                text: "И"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button10
                x: 480
                y: 329
                width: 40
                height: 40
                text: "Й"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button11
                x: 526
                y: 329
                width: 40
                height: 40
                text: "К"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button12
                x: 89
                y: 375
                width: 40
                height: 40
                text: "Л"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button13
                x: 135
                y: 375
                width: 40
                height: 40
                text: "М"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button14
                x: 181
                y: 375
                width: 40
                height: 40
                text: "Н"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button15
                x: 227
                y: 375
                width: 40
                height: 40
                text: "О"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button16
                x: 273
                y: 375
                width: 40
                height: 40
                text: "П"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button17
                x: 319
                y: 375
                width: 40
                height: 40
                text: "Р"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button18
                x: 365
                y: 375
                width: 40
                height: 40
                text: "С"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button19
                x: 411
                y: 375
                width: 40
                height: 40
                text: "Т"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button20
                x: 457
                y: 375
                width: 40
                height: 40
                text: "У"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button21
                x: 503
                y: 375
                width: 40
                height: 40
                text: "Ф"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button22
                x: 66
                y: 421
                width: 40
                height: 40
                text: "Х"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button23
                x: 112
                y: 421
                width: 40
                height: 40
                text: "Ц"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button24
                x: 158
                y: 421
                width: 40
                height: 40
                text: "Ч"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button25
                x: 204
                y: 421
                width: 40
                height: 40
                text: "Ш"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button26
                x: 250
                y: 421
                width: 40
                height: 40
                text: "Щ"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button27
                x: 296
                y: 421
                width: 40
                height: 40
                text: "Ь"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button28
                x: 342
                y: 421
                width: 40
                height: 40
                text: "Ы"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button29
                x: 388
                y: 421
                width: 40
                height: 40
                text: "Ъ"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button30
                x: 434
                y: 421
                width: 40
                height: 40
                text: "Э"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button31
                x: 480
                y: 421
                width: 40
                height: 40
                text: "Ю"
                onClicked:
                {
                    visible = false;

                }
            }

            Button {
                id: button32
                x: 526
                y: 421
                width: 40
                height: 40
                text: ("Я")
                onClicked:
                {
                    visible = false;

                }
            }
        }
    }
}
