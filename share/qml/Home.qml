import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief Home page presenting possible options
*/

Page {
    id: home
    header: PageHeader {
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
                onTriggered: pageStack.addPageToCurrentColumn(home, Qt.resolvedUrl("RecipeInfo.qml"))
            }
        ]
    }

    Column {
        spacing: units.gu(2)
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: home.header.bottom
            topMargin: parent.height / 4
        }

        Button {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: "Start a New Brew"
            onClicked: pageStack.addPageToCurrentColumn(home, Qt.resolvedUrl("RecipeInfo.qml"))
            color: theme.palette.normal.positive

            width: units.gu(30)
        }

        Button {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: "In Progress Brews"
            onClicked: print("fermenting")
            color: theme.palette.normal.positive

            width: units.gu(30)
        }

        Button {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: "Previous Brews"
            onClicked: print("history")
            color: theme.palette.normal.positive

            width: units.gu(30)
        }
    }
}
