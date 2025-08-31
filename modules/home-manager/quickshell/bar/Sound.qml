import QtQuick
import Quickshell.Services.Pipewire

Text {
    readonly property PwNode sink: Pipewire.defaultAudioSink
    property string volume: Pipewire.ready ? `${Math.floor(sink.audio.volume * 100)}` : ""
    PwObjectTracker {
        objects: [sink]
    }

    text: `   ${volume}%`
    color: "#F9F6EE"
}
