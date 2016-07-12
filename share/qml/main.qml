import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    objectName: "mainView"
    applicationName: "brew-buddy.larryprice"

    width: units.gu(100)
    height: units.gu(75)

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("Brew Buddy")
            leadingActionBar.actions: [
                Action {
                    iconName: "back"
                    visible: false
                }
            ]
            trailingActionBar.actions: [
                Action {
                    iconName: "add"
                    onTriggered: {
                        console.debug("add")
                    }
                }
            ]
        }

        Column {
            spacing: units.gu(2)
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: pageHeader.bottom
                topMargin: parent.height / 4
            }

            Button {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: "Start a New Brew"
                onClicked: print("add")
                color: UbuntuColors.green

                // iconName: "compose"
                width: units.gu(30)
            }

            Button {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: "In Progress Brews"
                onClicked: print("fermenting")
                color: UbuntuColors.green

                // iconName: "compose"
                width: units.gu(30)
            }

            Button {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: "Previous Brews"
                onClicked: print("history")
                color: UbuntuColors.green

                // iconName: "compose"
                 width: units.gu(30)
            }
        }
    }
}
