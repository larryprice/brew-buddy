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
                    pageStack.addPageToNextColumn(createRecipe, addFermentablePage)
                    addFermentablePage.add.connect(onAddFermentable)
                }
            }
        ]
    }

    function onAddFermentable(type_, desc_, weight_, units_) {
        addFermentablePage.add.disconnect(onAddFermentable)
        fermentables.append({name: desc_, type_: type_, weight: weight_, weightUnits: units_})
    }

    RecipeFermentablesAdd {
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
                    text: name
                    fontSize: "large"
                }
                Label {
                    text: weight + " " + weightUnits
                }
                Label {
                    text: type_
                    fontSize: "small"
                }
            }
        }
    }
}
