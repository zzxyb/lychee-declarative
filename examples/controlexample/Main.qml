import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import org.lychee.declarative  as LYCHEE

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {
        spacing: 10
        leftPadding: 20
        LYCHEE.Switch {

        }

        LYCHEE.SearchBox {

        }

        CheckBox {

        }

        ComboBox {
            model: ["First", "Second", "Third"]
        }

        RadioButton {

        }

        SpinBox {

        }

        Slider {
            from: 1
            value: 25
            to: 100
        }

        BusyIndicator {
            running: true
        }

        Button {
            text: "Cancel"
        }

        ProgressBar {
            value: 0.5
        }
    }
    /*TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Home")
        }
        TabButton {
            text: qsTr("Discover")
        }
        TabButton {
            text: qsTr("Activity")
        }
    }

    StackLayout {
        width: parent.width
        currentIndex: bar.currentIndex
        Item {
            id: homeTab
        }
        Item {
            id: discoverTab
        }
        Item {
            id: activityTab
        }
    }*/
}
