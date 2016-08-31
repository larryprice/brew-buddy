import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief RecipeFermentables page for defining brew ingredients
*/

Page {
    id: createRecipe
    header: PageHeader {
        title: i18n.tr("Recipe - Fermentables")
        trailingActionBar.actions: [
            Action {
                iconName: "add"
                onTriggered: {
                    pageStack.addPageToNextColumn(createRecipe, Qt.resolvedUrl("RecipeFermentablesAdd.qml"))
                }
            }
        ]
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
        model: recipe.fermentables.len

        delegate: ListItem {
            height: units.gu(9)
            leadingActions: ListItemActions {
              actions: [
                Action {
                  iconName: "delete"
                  onTriggered: {
                      console.debug("REMOVE FERMENTABLE FROM MODEL")
                  }
                }
              ]
            }
            trailingActions: ListItemActions {
              actions: [
                Action {
                  iconName: "edit"
                  onTriggered: {
                    console.debug("EDIT FERMENTABLE MODEL")
                  }
                }
              ]
            }
            Column {
                anchors {
                    margins: units.gu(1)
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }

                Label {
                    text: recipe.fermentables.get(index).description
                    fontSize: "large"
                }
                Label {
                    text: recipe.fermentables.get(index).weight + " " + recipe.fermentables.get(index).weightUnits
                }
                Label {
                    text: recipe.fermentables.get(index).fermType
                    fontSize: "small"
                }
            }
        }
    }
}
