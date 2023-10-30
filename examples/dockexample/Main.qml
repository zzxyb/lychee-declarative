import QtQuick
import QtQuick.Window
import org.lychee.declarative  as LYCHEE

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    LYCHEE.Switch {
        text: "Wi-Fi"
    }
}
