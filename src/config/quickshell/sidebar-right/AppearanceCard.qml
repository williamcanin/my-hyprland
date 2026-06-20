import QtQuick
import QtQuick.Layouts
import Quickshell.Io

BaseCard {
    cardTitle: Strings.cardTitleAppearance
    cardIcon:  "»"

    RowLayout {
        Layout.fillWidth: true
        spacing: 6

        GlassButton {
            Layout.fillWidth: true
            implicitHeight: 52
            iconText: "\uf03e"
            label: Strings.btnWallpaper
            onClicked: wallpaperProc.running = true
        }

        GlassButton {
            Layout.fillWidth: true
            implicitHeight: 52
            iconText: "\uf53f"
            label: Strings.btnTheme
            onClicked: themeProc.running = true
        }
    }

    Process {
        id: wallpaperProc
        command: ["bash", "-c", "sh $HOME/.config/hypr/scripts/wallpaper-pick.sh"]
    }

    Process {
        id: themeProc
        command: ["bash", "-c",
            "ls $HOME/.config/hypr/themes | rofi -dmenu -p 'Theme' | xargs -I{} $HOME/.config/my-environment/sh/theme-switch.sh {}"
        ]
        onExited: Theme.reloadActiveTheme()
    }
}
