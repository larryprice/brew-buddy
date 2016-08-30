import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief CreateInfo page for descriptive brew info entry
*/

Page {
    id: createInfo
    header: PageHeader {
        title: i18n.tr("Recipe Information")
    }

    property alias name: nameField.text
    property var valid: nameField.text !== "" && brewersField.text !== "" && descriptionField.text !== ""

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
            id: nameField
            anchors {
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }
            width: parent.width
            text: recipe.info.name

            onTextChanged: {
              recipe.setName(nameField.text)
            }

            placeholderText: "Hoptown Funk"
        }

        Label {
            text: "Brewers"
        }

        TextField {
            id: brewersField
            anchors {
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }
            width: parent.width
            text: recipe.info.brewers

            onTextChanged: {
              recipe.setBrewers(brewersField.text)
            }

            placeholderText: "Larry, Corinne"
        }

        Label {
            text: "Description"
        }

        TextArea {
            id: descriptionField
            anchors {
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }
            width: parent.width
            height: Math.max(parent.height / 3, units.gu(6))
            text: recipe.info.description
            onTextChanged: {
              recipe.setDescription(descriptionField.text)
            }

            placeholderText: "Light belgian ale with amarillo hops perfect for a summer barbeque."
        }
    }
}
