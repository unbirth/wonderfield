import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    opacity: 1
    title: qsTr("WonderField")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    Button{
        id: startGameButton
        x: mainWindow.width / 2 - width / 2
        y: mainWindow.height / 2 - width / 2
        text: "Начать игру!"
        width: mainWindow.width / 2
        height: mainWindow.height / 2
    }
}
