import QtQuick
import Quickshell
import Quickshell.Io
import qs

// A panel plugin: owns its window and its IPC. `qs ipc call example.hello toggle`
Scope {
    id: root
    property bool shown: false

    IpcHandler {
        target: "example.hello"
        function toggle(): void { root.shown = !root.shown }
        function hide(): void { root.shown = false }
    }

    PanelWindow {
        visible: root.shown
        anchors { bottom: true; right: true }
        margins { bottom: 12; right: 12 }
        implicitWidth: 260
        implicitHeight: 72
        color: "transparent"
        Rectangle {
            anchors.fill: parent
            radius: Theme.radius
            color: Theme.bg2
            Text {
                anchors.centerIn: parent
                text: "Hello from example.hello"
                color: Theme.fg1
                font.family: Theme.fontText
                font.pixelSize: Theme.fsBody
            }
        }
    }
}
