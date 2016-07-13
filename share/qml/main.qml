import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    objectName: "mainView"
    applicationName: "brew-buddy.larryprice"

    width: units.gu(100)
    height: units.gu(75)

    AdaptivePageLayout {
        anchors.fill: parent
        primaryPage: home

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
                        onTriggered: home.pageStack.addPageToCurrentColumn(home, createInfo)
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
                    onClicked: home.pageStack.addPageToCurrentColumn(home, createInfo)
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

        Page {
            id: createInfo
            header: PageHeader {
                title: i18n.tr("Create a Brew")
            }

            Column {
                anchors {
                    top: createInfo.header.bottom
                    left: parent.left
                    right: parent.right
                    margins: units.gu(1)
                }
                spacing: units.gu(2)
                height: parent.height

                Label {
                    text: "Name"
                }

                TextField {
                    anchors {
                        leftMargin: units.gu(2)
                        rightMargin: units.gu(2)
                    }
                    width: parent.width

                    placeholderText: "Hoptown Funk"
                }

                Label {
                    text: "Brewers"
                }

                TextField {
                    anchors {
                        leftMargin: units.gu(2)
                        rightMargin: units.gu(2)
                    }
                    width: parent.width

                    placeholderText: "Larry, Corinne"
                }

                Label {
                    text: "Description"
                }

                TextArea {
                    anchors {
                        leftMargin: units.gu(2)
                        rightMargin: units.gu(2)
                    }
                    width: parent.width
                    height: Math.max(parent.height / 3, units.gu(6))

                    placeholderText: "Light belgian ale with amarillo hops perfect for a summer barbeque."
                }

                Button {
                    anchors {
                        right: parent.right
                    }

                    text: "Continue to Recipe"
                    color: theme.palette.normal.positive
                    onClicked: createInfo.pageStack.addPageToNextColumn(createInfo, createRecipe)
                }
            }
        }

        Page {
            id: createRecipe
            header: PageHeader {
                title: i18n.tr("Recipe")
            }

            Column {
                Button {
                    onClicked: create.pageStack.addPageToNextColumn(create, cc)
                }
            }
        }
    }
}
