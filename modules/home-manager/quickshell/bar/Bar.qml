import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            implicitHeight: 30
            color: "#0E0E10"
            aboveWindows: false

            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 6
                spacing: 0

                Item {
                    Layout.preferredWidth: parent.width / parent.children.length
                }

                TimeWidget {
                    Layout.preferredWidth: parent.width / parent.children.length
                }

                BatteryWidget {
                    Layout.preferredWidth: parent.width / parent.children.length
                }
            }
        }
    }
}
