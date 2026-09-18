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
        margins { bottom: Theme.windowGap; right: Theme.windowGap }
        implicitWidth: Theme.panelSm
        implicitHeight: Theme.control2xl + 2 * Theme.spaceS
        color: "transparent"
        // a panel is solid (never Glass): surfaceRaised, a borderSubtle
        // outline and the radiusRounded corner, like ewe's own
        Rectangle {
            anchors.fill: parent
            radius: Theme.radiusRounded
            color: Theme.surfaceRaised
            border.color: Theme.borderSubtle; border.width: Theme.borderWidth1
            Text {
                anchors.centerIn: parent
                text: "Hello from example.hello"
                color: Theme.textPrimary
                font.family: Theme.type.body.family
                font.pixelSize: Theme.type.body.size
            }
        }
    }
}
