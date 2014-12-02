import QtQuick 2.3
import QtQuick.Controls 1.2
import com.me.qmlcomponents 1.0

Rectangle
{
    property string text: " "
    id: container
    width: 40;
    height: 40
    color: "white"
    border
    {
        width: 2
        color: "#333333"
    }

    Text
    {
        id: label
        visible: true
        text: container.text
        font.pixelSize: 16
        anchors.centerIn: container
    }
}
