import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

PanelWindow {
    id: root

    property bool sidebarVisible: false

    screen: Quickshell.screens[0]

    WlrLayershell.margins {
        top: 1
        right: 0
        bottom: 0
        left: 0
    }

    WlrLayershell.keyboardFocus: sidebarVisible
        ? WlrKeyboardFocus.OnDemand
        : WlrKeyboardFocus.None

    anchors {
        top: true
        bottom: true
        right: true
    }

    aboveWindows: true
    exclusiveZone: 0
    implicitWidth: sidebarVisible ? 359 : 0

    Behavior on implicitWidth {
        NumberAnimation { duration: 70; easing.type: Easing.OutBounce }
    }

    color: "transparent"

    onSidebarVisibleChanged: {
        stateProc.running = true
        if (sidebarVisible)
            keyCatcher.forceActiveFocus()
    }

    Process {
        id: stateProc
        command: ["bash", "-c",
            root.sidebarVisible
                ? "echo open > $HOME/.cache/waybar/sidebar-state"
                : "echo close > $HOME/.cache/waybar/sidebar-state"
        ]
    }

    MouseArea {
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: panel.left
        }
        enabled: root.sidebarVisible
        onClicked: root.sidebarVisible = false
    }

    Item {
        id: panel
        x: root.sidebarVisible ? (root.width - width - 8) : root.width
        y: 5
        width: 350
        height: root.height - 5 - 10

        // Borda do painel
        Rectangle {
            anchors.fill: parent
            color: Theme.bgPanel
            border.color: Theme.borderSubtle
            border.width: 1
            radius: Theme.radius
        }

        // Captura Esc
        Item {
            id: keyCatcher
            anchors.fill: parent
            focus: true
            Keys.onEscapePressed: root.sidebarVisible = false
            MouseArea {
                anchors.fill: parent
                onClicked: {}
            }
        }

        // Flickable — mais confiável que ScrollView para calcular contentHeight
        Flickable {
            id: flick
            anchors {
                fill: parent
                rightMargin: 10   // espaço para a scrollbar
            }
            clip: true
            contentWidth: width
            contentHeight: contentCol.implicitHeight
            flickDeceleration: 3000
            maximumFlickVelocity: 2000
            boundsBehavior: Flickable.StopAtBounds

            ColumnLayout {
                id: contentCol
                width: flick.width
                spacing: 8

                Item { Layout.preferredHeight: 2 }

                UserCard          { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                NotificationCard  { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                CalendarCard      { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                WeatherCard       { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                VolumeCard        { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                NetworkCard       { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                SystemCard        { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                KeyboardCard      { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                AppearanceCard    { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }
                PowerCard         { Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10 }

                Item { Layout.preferredHeight: 10 }
            }
        }

        // Scrollbar manual — track
        Rectangle {
            id: scrollTrack
            anchors {
                right: panel.right
                top: panel.top
                bottom: panel.bottom
                rightMargin: 3
                topMargin: 8
                bottomMargin: 8
            }
            width: 3
            radius: 2
            color: Theme.scrollbarBg
            visible: flick.contentHeight > flick.height

            // Thumb
            Rectangle {
                id: scrollThumb
                width: parent.width
                radius: 2

                height: Math.max(32,
                    scrollTrack.height * (flick.height / Math.max(flick.contentHeight, 1))
                )

                y: flick.contentHeight > flick.height
                    ? (scrollTrack.height - height)
                        * (flick.contentY / (flick.contentHeight - flick.height))
                    : 0

                color: thumbMa.pressed
                      ? Theme.scrollbarFg
                      : thumbMa.containsMouse
                          ? Qt.rgba(1, 1, 1, 0.75)
                          : Theme.scrollbarFg

                Behavior on color { ColorAnimation { duration: 150 } }

                MouseArea {
                    id: thumbMa
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.SizeVerCursor

                    property real startY: 0
                    property real startContentY: 0

                    onPressed: function(mouse) {
                        startY        = mouse.y + scrollThumb.y
                        startContentY = flick.contentY
                    }
                    onPositionChanged: function(mouse) {
                        if (!pressed) return
                        var delta = (mouse.y + scrollThumb.y) - startY
                        var ratio = delta / (scrollTrack.height - scrollThumb.height)
                        flick.contentY = Math.max(0,
                            Math.min(startContentY + ratio * (flick.contentHeight - flick.height),
                                     flick.contentHeight - flick.height))
                    }
                }
            }
        }
    }
}
