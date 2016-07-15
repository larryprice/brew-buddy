import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief CreateRecipe page for defining brew ingredients
*/

Page {
    id: createRecipe
    header: PageHeader {
        title: i18n.tr("Recipe - Grain Bill")
        trailingActionBar.actions: [
            Action {
                iconName: "add"
                onTriggered: {
                    fermentables.append({name: "grain #" + (fermentables.count+1)})
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
        model: fermentables

        delegate: ListItem {
            Label {
                text: name
            }
        }
    }
}
