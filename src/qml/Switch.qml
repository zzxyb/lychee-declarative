import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.Switch {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 5
    spacing: 8

    property bool useSystemFocusVisuals: true

    indicator: Item {
        id: indicator
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        implicitWidth: 44
        implicitHeight: 20

        property T.AbstractButton control

        Rectangle {
            width: parent.width
            height: parent.height

            radius: 10
            color: !control.checked ? "darkgray" : control.palette.highlight
            opacity: enabled && control.hovered && !control.pressed ? 0.9 : 1.0
        }

        Rectangle {
            width: 10
            height: 10
            radius: 5
            color: "white"
            x: Math.max(5, Math.min(parent.width - width - 5,
                                    control.visualPosition * parent.width - (width / 2)))
            y: (parent.height - height) / 2

            Behavior on x {
                enabled: !control.pressed
                SmoothedAnimation { velocity: 200 }
            }
        }
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter

        opacity: enabled ? 1.0 : 0.2
        color: control.palette.windowText
    }
}
