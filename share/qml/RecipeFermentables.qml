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
            property var item: recipe.fermentables.get(index)
            height: units.gu(9)
            leadingActions: ListItemActions {
              actions: [
                Action {
                  iconName: "delete"
                  onTriggered: {
                    recipe.fermentables.delete(index)
                  }
                }
              ]
            }
            trailingActions: ListItemActions {
              actions: [
                Action {
                  iconName: "edit"
                  onTriggered: {
                      pageStack.addPageToNextColumn(createRecipe, Qt.resolvedUrl("RecipeFermentablesAdd.qml"), {item: item, index: index})
                  }
                }
              ]
            }
            onClicked: {
                pageStack.addPageToNextColumn(createRecipe, Qt.resolvedUrl("RecipeFermentablesAdd.qml"), {item: item, index: index})
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
                    text: item.weight + " " + item.weightUnits
                }
                Label {
                    text: item.fermType
                    fontSize: "small"
                }
            }
        }
    }
}
