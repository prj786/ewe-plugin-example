import QtQuick
import qs

// A bar widget: an Item with an implicit size, packed by the bar like a
// built-in module (Bar card): barModule tall, spaceS of side padding,
// radiusPrimary, no fill until you point at it. The bar* roles already
// follow Glass; everything else is a Theme token (design system v3).
Item {
    id: root
    property string label: "hello"
    implicitWidth: row.implicitWidth + 2 * Theme.spaceS
    implicitHeight: Theme.barModule
    Rectangle {
        anchors.fill: parent
        radius: Theme.radiusPrimary
        color: ma.pressed ? Theme.barPressedFill : ma.containsMouse ? Theme.barHoverFill : "transparent"
        Behavior on color { ColorAnimation { duration: Theme.durFast; easing.type: Theme.easeFast } }
    }
    Row {
        id: row
        anchors.centerIn: parent
        spacing: Theme.spaceXs
        Text { anchors.verticalCenter: parent.verticalCenter; text: Theme.icStar; font.family: Theme.fontIcons; font.pixelSize: Theme.barIcon; color: ma.containsMouse ? Theme.textPrimary : Theme.textSecondary }
        Text {
            anchors.verticalCenter: parent.verticalCenter; text: root.label; color: Theme.textPrimary
            font.family: Theme.type.label.family; font.pixelSize: Theme.type.label.size; font.weight: Theme.type.label.weight
        }
    }
    MouseArea { id: ma; anchors.fill: parent; hoverEnabled: true; cursorShape: Qt.PointingHandCursor; onClicked: Globals.openSettings() }
}
