import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    id: addFermentable
    header: PageHeader {
        title: i18n.tr("Add Fermentable")
    }
    property var item: undefined
    property var index: -1

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
            id: fermentableType
            anchors {
                left: parent.left
                leftMargin: units.gu(2)
            }
            width: units.gu(23)
            text: item ? item.fermType : "Malt"
            expandedHeight: units.gu(18)
            onClicked: expanded = !expanded
            UbuntuListView {
                height: fermentableType.comboListHeight
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
                        fermentableType.text = modelData;
                        fermentableType.expanded = false;
                    }
                }
            }
        }

        Label {
            text: "Description"
        }

        TextField {
            id: description
            anchors {
                leftMargin: units.gu(2)
                left: parent.left
                right: parent.right
            }
            text: item ? item.description : ""

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
                id: weight
                text: item ? item.weight : ""
                placeholderText: "9"
            }


            ComboButton {
                id: weightUnits
                width: units.gu(15)
                text: item ? item.weightUnits : "lbs"
                expandedHeight: units.gu(18)
                onClicked: expanded = !expanded
                UbuntuListView {
                    height: weightUnits.comboListHeight
                    model: ["", "lbs", "oz", "gal", "kg", "g", "l", "ml"]
                    delegate: ListItem {
                        height: units.gu(3)
                        Label {
                            anchors {
                                centerIn: parent
                            }

                            text: modelData
                        }

                        onClicked: {
                            weightUnits.text = modelData;
                            weightUnits.expanded = false;
                        }
                    }
                }
            }
        }

        Button {
            text: index > -1 ? "Update" : "Add"
            color: theme.palette.normal.positive
            enabled: description.text !== "" && weight.text !== ""
            onTriggered: {
                if (index === -1) {
                    recipe.fermentables.add(fermentableType.text, description.text, weight.text, weightUnits.text);
                } else {
                    recipe.fermentables.edit(index, fermentableType.text, description.text, weight.text, weightUnits.text);
                }
                pageStack.removePages(addFermentable)
            }
        }
    }
}
