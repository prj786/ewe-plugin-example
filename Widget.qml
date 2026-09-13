import QtQuick
import qs

// A bar widget: an Item with an implicit size, packed by the bar like a
// built-in indicator. Uses the bar's own conventions from Theme.
Item {
    id: root
    property string label: "hello"
    implicitWidth: row.implicitWidth + 2 * Theme.barItemPad
    implicitHeight: Theme.barItemHeight
    Rectangle {
        anchors.fill: parent
        radius: Theme.barItemRadius
        color: ma.containsMouse ? Theme.barHover : "transparent"
        Behavior on color { ColorAnimation { duration: Theme.durFast } }
    }
    Row {
        id: row
        anchors.centerIn: parent
        spacing: 5
        Text { anchors.verticalCenter: parent.verticalCenter; text: Theme.icStar; font.family: Theme.fontIcons; font.pixelSize: Theme.barIconPx; color: Theme.fg2 }
        Text { anchors.verticalCenter: parent.verticalCenter; text: root.label; font.family: Theme.fontText; font.pixelSize: 12; color: Theme.fg1 }
    }
    MouseArea { id: ma; anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor; onClicked: Globals.openSettings() }
}
