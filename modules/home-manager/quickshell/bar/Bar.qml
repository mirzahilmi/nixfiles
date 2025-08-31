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
            color: "#993B3C36"
            aboveWindows: false

            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 6

                Time {
                    anchors.centerIn: parent
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    Layout.fillWidth: true
                    spacing: 12
                    Sound {}
                    Battery {}
                }
            }
        }
    }
}
