import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief RecipeSpecifications For specifying things like OG, FG, and ABV
*/

Page {
    id: createSpecs
    header: PageHeader {
        title: i18n.tr("Recipe Specifications")
    }

    property var valid: originalGravity.text !== "" && finalGravity.text !== "" &&
                        abv.text !== "" && srm.text !== "" && ibu.text !== ""

    Column {
        anchors {
            top: createSpecs.header.bottom
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }
        spacing: units.gu(2)
        height: parent.height

        Label {
            text: "Original Gravity"
        }

        TextField {
            id: originalGravity
            anchors {
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }

            placeholderText: "1.057"
        }

        Label {
            text: "Final Gravity"
        }

        TextField {
            id: finalGravity
            anchors {
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }

            placeholderText: "1.010"
        }

        Label {
            text: "% Alcohol By Volume"
        }

        TextField {
            id: abv
            anchors {
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }

            placeholderText: "6.1"
        }

        Label {
            text: "Color SRM"
        }

        TextField {
            id: srm
            anchors {
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }

            placeholderText: "9"
        }

        Label {
            text: "International Bitterness Units"
        }

        TextField {
            id: ibu
            anchors {
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }

            placeholderText: "22"
        }
    }
}
