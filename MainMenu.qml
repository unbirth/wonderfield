import QtQuick 2.0
import QtQuick.Controls 1.2
import com.me.qmlcomponents 1.0

Item {



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
