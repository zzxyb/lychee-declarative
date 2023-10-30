import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import org.lychee.declarative  as LYCHEE

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")

    Image {
        anchors.fill: parent
        source: "yushuiwallpaper"

        SwipeView {
            id: view

            currentIndex: 1
            anchors.fill: parent

            Item {
                id: firstPage

                Rectangle {
                    anchors.fill: parent
                    color: "red"
                }
            }
            Item {
                id: secondPage

                Rectangle {
                    anchors.fill: parent
                    color: "blue"
                }
            }
            Item {
                id: thirdPage
            }
        }

        PageIndicator {
            id: indicator

            count: view.count
            currentIndex: view.currentIndex

            anchors.bottom: view.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
