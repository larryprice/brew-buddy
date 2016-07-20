import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    id: addFermentable
    header: PageHeader {
        title: i18n.tr("Create Fermentable")
    }

    Column {
        spacing: units.gu(2)
        anchors {
            top: addFermentable.header.bottom
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }

        Label {
            text: "Type"
        }

        ComboButton {
            id: combo
            anchors {
                left: parent.left
                leftMargin: units.gu(2)
            }
            width: units.gu(23)
            text: "Malt"
            expandedHeight: units.gu(18)
            onClicked: expanded = !expanded
            UbuntuListView {
                height: combo.comboListHeight
                model: ["Malt", "Extract", "Adjunct", "Other"]
                delegate: ListItem {
                    height: units.gu(3)
                    Label {
                        anchors {
                            centerIn: parent
                        }

                        text: modelData
                    }

                    onClicked: {
                        combo.text = modelData;
                        combo.expanded = false;
                    }
                }
            }
        }

        Label {
            text: "Description"
        }

        TextField {
            anchors {
                leftMargin: units.gu(2)
                left: parent.left
                right: parent.right
            }

            placeholderText: "2-row barley"
        }

        Label {
            text: "Weight"
        }

        Row {
            spacing: units.gu(1)
            anchors {
                leftMargin: units.gu(2)
                left: parent.left
                right: parent.right
            }

            TextField {
                placeholderText: "9"
            }

            TextField {
                placeholderText: "units"
            }
        }

        Button {
            text: "Add"
            color: theme.palette.normal.positive
            onTriggered: {
                console.debug("add this!")
            }
        }
    }
}
