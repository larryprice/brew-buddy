import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief CreateFermentables page for defining brew ingredients
*/

Page {
    id: createRecipe
    header: PageHeader {
        title: i18n.tr("Recipe - Fermentables")
        trailingActionBar.actions: [
            Action {
                iconName: "add"
                onTriggered: {
                    pageStack.addPageToNextColumn(createRecipe, addFermentablePage)

                    addFermentablePage.add.connect(function(type_, desc_, weight_, units_) {
                        console.debug("ok, adding...", type_, desc_, weight_, units_)
                    })
                }
            }
        ]
    }

    AddFermentable {
        id: addFermentablePage
    }

    ListModel {
        id: fermentables
    }

    UbuntuListView {
        anchors {
            top: createRecipe.header.bottom
            left: parent.left;
            right: parent.right;
        }
        height: parent.height
        model: fermentables

        delegate: ListItem {
            Label {
                text: name
            }
        }
    }
}
