import QtQuick
import QtQuick.Layouts
import Quickshell.Io

BaseCard {
    cardTitle: "USUÁRIO"
    cardIcon:  "»"

    property string fullName: ""
    property string userName: ""
    property string hostName: ""
    property string userIcon: "\uf007"

    Timer {
        interval: 500; running: true; repeat: false
        onTriggered: userProc.running = true
    }

    Process {
        id: userProc
        command: ["bash", "-c",
            "echo \"$(getent passwd $(whoami) | cut -d: -f5 | cut -d, -f1)\"; " +
            "whoami; hostname"
        ]
        stdout: SplitParser {
            onRead: data => {
                var parts = data.trim().split(/\n/)
                if (parts.length >= 3) {
                    fullName = parts[0]
                    userName = parts[1]
                    hostName = parts[2]
                } else if (parts.length >= 2) {
                    userName = parts[0]
                    hostName = parts[1]
                }
            }
        }
    }

    RowLayout {
        Layout.fillWidth: true
        spacing: 10

        Rectangle {
            implicitWidth: 40
            implicitHeight: 40
            radius: 20
            color: Theme.accentDim

            Text {
                anchors.centerIn: parent
                text: userIcon
                font.family: "Font Awesome 6 Free"
                font.pixelSize: 18
                font.weight: Font.Black
                color: Theme.accent
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 2

            Text {
                text: fullName && fullName !== userName ? fullName : userName
                color: Theme.fgText
                font.pixelSize: 13
                font.weight: Font.Bold
                font.family: "monospace"
                elide: Text.ElideRight
            }

            Text {
                text: userName + "@" + hostName
                color: Theme.fgDim
                font.pixelSize: 10
                font.family: "monospace"
                elide: Text.ElideRight
            }
        }
    }
}
