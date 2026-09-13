import QtQuick
import qs

// A headless plugin: proves `import qs` reaches the shell's singletons.
QtObject {
    Component.onCompleted: Log.info("example.hello", "service up — ewe", Globals.version, "accent", Theme.accent)
}
