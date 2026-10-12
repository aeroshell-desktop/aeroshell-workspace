import QtQuick

import org.kde.plasma.core as PlasmaCore

import aeroshell.components.private as Private

Item {
    id: root

    signal clicked()

    readonly property bool hovered: hoverHandler.hovered
    readonly property bool pressed: tapHandler.pressed

    property bool toggled: false

    property url textureSource: ""
    onTextureSourceChanged: repositionWindow();

    property bool floating: false
    property int buttonWidthOverride: 0
    onButtonWidthOverrideChanged: repositionWindow();

    property bool animate: true

    implicitWidth: buttonLoader.item?.buttonWidth ?? 0
    implicitHeight: buttonLoader.item?.buttonHeight ?? 0

    onXChanged: repositionWindow();
    onYChanged: repositionWindow();
    onWidthChanged: repositionWindow();
    onHeightChanged: repositionWindow();

    function repositionWindow() {
        if (floating && buttonLoader.item) {
            buttonLoader.item.position();
        }
    }

    QtObject {
        id: internal

        property bool creationCompleted: false
    }

    HoverHandler { id: hoverHandler }
    TapHandler { id: tapHandler; onTapped: root.clicked() }

    Loader {
        id: buttonLoader

        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter

        sourceComponent: root.floating ? floatingButton : button
        asynchronous: false
        active: internal.creationCompleted

        Binding {
            target: buttonLoader.item
            property: "hovered"
            value: root.hovered
        }
        Binding {
            target: buttonLoader.item
            property: "pressed"
            value: root.pressed
        }
        Binding {
            target: buttonLoader.item
            property: "toggled"
            value: root.toggled
        }
        Binding {
            target: buttonLoader.item
            property: "orbTexture"
            value: root.textureSource
        }
        Binding {
            target: buttonLoader.item
            property: "animate"
            value: root.animate
        }
        Binding {
            target: buttonLoader.item
            property: "orbWidth"
            value: root.buttonWidthOverride
        }

        Component {
            id: floatingButton

            // BUG: positioning stops working when changing any orb related property
            PlasmaCore.Dialog {
                id: buttonWindow

                readonly property alias buttonWidth: buttonWindowItem.buttonWidth
                readonly property alias buttonHeight: buttonWindowItem.buttonHeight

                property alias hovered: buttonWindowItem.hovered
                property alias pressed: buttonWindowItem.pressed
                property alias toggled: buttonWindowItem.toggled
                property alias orbTexture: buttonWindowItem.orbTexture
                property alias orbWidth: buttonWindowItem.orbWidth
                property alias animate: buttonWindowItem.animate

                function position() {
                    var pos = root.mapToGlobal(root.x, root.y);
                    x = pos.x;
                    y = pos.y;
                }

                onWidthChanged: position();
                onHeightChanged: position();

                flags: Qt.WindowTransparentForInput | Qt.WindowStaysOnTopHint
                title: "__AEROSHELL_STARTBUTTON"
                // Tooltip because it's the only type that can overlap everything and not be overlapped
                // by other windows like the SevenStart/VistaStart menu one
                type: PlasmaCore.Dialog.Tooltip
                location: PlasmaCore.Types.Floating
                backgroundHints: PlasmaCore.Types.NoBackground

                visible: true

                mainItem: Item {
                    width: buttonWindowItem.width
                    height: buttonWindowItem.height

                    Private.StartButtonItem {
                        id: buttonWindowItem
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset: 5
                    }
                }

                Component.onCompleted: buttonWindow.position();
            }
        }

        Component {
            id: button

            Private.StartButtonItem {  }
        }
    }

    Component.onCompleted: internal.creationCompleted = true;
}
