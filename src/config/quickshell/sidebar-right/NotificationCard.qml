import QtQuick
import QtQuick.Layouts
import Quickshell.Io

BaseCard {
    cardTitle: Strings.cardTitleNotifications
    cardIcon:  "»"

    property var notifications: []
    property int unreadCount: 0

    Timer {
        interval: 3000; running: true; repeat: true; triggeredOnStart: true
        onTriggered: historyProc.running = true
    }

    Process {
        id: historyProc
        command: ["dunstctl", "history"]
        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    var data = JSON.parse(this.text)
                    var items = []
                    var entries = data.data[0] || []
                    for (var i = 0; i < entries.length && i < 5; i++) {
                        var n = entries[i]
                        items.push({
                            app:     n.appname  ? n.appname.data  : "sistema",
                            summary: n.summary  ? n.summary.data  : "",
                            body:    n.body     ? n.body.data     : ""
                        })
                    }
                    notifications = items
                    unreadCount   = items.length
                } catch(e) {
                    notifications = []
                    unreadCount   = 0
                }
            }
        }
    }

    Process {
        id: clearProc
        command: ["dunstctl", "history-clear"]
        onExited: function(code) {
            if (code === 0) {
                notifications = []
                unreadCount   = 0
            }
        }
    }

    // Header: count + clear button
    RowLayout {
        Layout.fillWidth: true

        Text {
            text: unreadCount > 0 ? unreadCount + " " + Strings.notifRecent : Strings.notifNone
            color: Theme.fgText
            font.pixelSize: 10
            font.family: "monospace"
            Layout.fillWidth: true
        }

        GlassButton {
            visible: unreadCount > 0
            implicitWidth: 70
            implicitHeight: 22
            iconText: "\uf2ed"
            label: Strings.notifClear
            active: false
            radius: 3
            onClicked: clearProc.running = true
        }
    }

    // List of notifications
    Repeater {
        model: notifications
        delegate: Rectangle {
            Layout.fillWidth: true
            implicitHeight: notifCol.implicitHeight + 12
            radius: 4
            color: Theme.bgPanel
            border.color: Theme.borderSubtle
            border.width: 1

            ColumnLayout {
                id: notifCol
                anchors { fill: parent; margins: 8 }
                spacing: 2

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 4
                    Text {
                        text: "\uf192"
                        font.family: "Font Awesome 6 Free"
                        font.pixelSize: 8
                        font.weight: Font.Black
                        color: Theme.accent
                        opacity: 1
                    }
                    Text {
                        text: modelData.app
                        color: Theme.accent
                        font.pixelSize: 9
                        font.family: "monospace"
                        opacity: 1
                        Layout.fillWidth: true
                        elide: Text.ElideRight
                    }
                }

                Text {
                    Layout.fillWidth: true
                    text: modelData.summary
                    color: Theme.fgText
                    font.pixelSize: 10
                    font.family: "monospace"
                    font.weight: Font.Medium
                    wrapMode: Text.WordWrap
                    visible: modelData.summary !== ""
                }

                Text {
                    Layout.fillWidth: true
                    text: modelData.body
                    color: Theme.fgText
                    font.pixelSize: 9
                    font.family: "monospace"
                    wrapMode: Text.WordWrap
                    visible: modelData.body !== ""
                    maximumLineCount: 2
                    elide: Text.ElideRight
                }
            }
        }
    }

    // Empty state
    Text {
        visible: notifications.length === 0
        Layout.fillWidth: true
        text: "\uf00d  " + Strings.notifAllClear
        font.pixelSize: 10
        font.family: "monospace"
        color: Theme.accent
        opacity: 1
        horizontalAlignment: Text.AlignHCenter
    }
}
