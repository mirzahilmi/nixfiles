pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Scope {
    id: root
    readonly property real brightness: Number(backlightCurrent.text()) / Number(backlightMax.text()) * 100

    FileView {
        id: backlightCurrent
        path: Qt.resolvedUrl("/sys/class/backlight/intel_backlight/actual_brightness")
        blockLoading: true
        watchChanges: true
        onFileChanged: {
            this.reload();
            AudioState.hidden = true;
            BrightnessState.hidden = false;
            hideTimer.restart();
        }
    }

    FileView {
        id: backlightMax
        path: Qt.resolvedUrl("/sys/class/backlight/intel_backlight/max_brightness")
        blockLoading: true
    }

    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: BrightnessState.hidden = true
    }

    LazyLoader {
        active: !BrightnessState.hidden

        PanelWindow {
            anchors.bottom: true
            margins.bottom: screen.height / 16
            exclusiveZone: 0

            implicitWidth: 400
            implicitHeight: 50
            color: "transparent"

            // An empty click mask prevents the window from blocking mouse events.
            mask: Region {}

            Rectangle {
                anchors.fill: parent
                radius: height / 2
                color: "#80000000"

                RowLayout {
                    spacing: 16
                    anchors {
                        fill: parent
                        leftMargin: 10
                        rightMargin: 15
                    }

                    Text {
                        text: {
                            if (root.brightness < 10)
                                return "󱩐 ";
                            if (root.brightness < 20)
                                return "󱩑 ";
                            if (root.brightness > 20 && root.brightness < 40)
                                return "󱩒 ";
                            if (root.brightness > 40 && root.brightness < 60)
                                return "󱩓 ";
                            if (root.brightness > 60 && root.brightness < 91)
                                return "󱩔 ";
                            return "󰛨 ";
                        }
                        font.pointSize: 26
                        color: "#F9F6EE"
                    }

                    Rectangle {
                        Layout.fillWidth: true

                        implicitHeight: 10
                        radius: 20
                        color: "#50ffffff"

                        Rectangle {
                            anchors {
                                left: parent.left
                                top: parent.top
                                bottom: parent.bottom
                            }

                            implicitWidth: parent.width * (root.brightness / 100 * 1)
                            radius: parent.radius
                        }
                    }
                }
            }
        }
    }
}
