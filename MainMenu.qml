import QtQuick 2.0
import QtQuick.Controls 1.0
import com.me.qmlcomponents 1.0

Item {
    id: mainMenu

    Image {
        id: backGroundImage
        x: 0
        y: 0
        width: 800
        height: 600
        source: "qrc:/res/pictures/w_background.png"
    }

    Image {
        id: rotatingBaraban
        x: 566
        y: -50
        width: 700
        height: 700
        sourceSize.width: 415
        source: "qrc:/res/pictures/w_bar.png"
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

        horizontalAlignment: Image.AlignHCenter
        x: 30
        y: 30
        width: 328 * 1.5
        height: 151 * 1.5
        source: "qrc:/res/pictures/w_logo.png"
    }



}
