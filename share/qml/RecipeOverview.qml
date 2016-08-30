import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief RecipeOverview page for defining brew ingredients
*/

Page {
    id: recipeOverview
    header: PageHeader {
        title: recipeInfoPage.name === "" ? i18n.tr("New Beer") : recipeInfoPage.name
    }

    Component.onCompleted: {
        var timer = Qt.createQmlObject("import QtQuick 2.3; Timer {interval: 10; repeat: false; running: true;}", recipeOverview, "MyTimer");
        timer.triggered.connect(function(){
            recipeOverview.pageStack.addPageToNextColumn(recipeOverview, recipeInfoPage)
        });
    }

    Column {
        anchors {
            top: recipeOverview.header.bottom
            left: parent.left;
            right: parent.right;
        }
        height: parent.height

        ListItem {
            onClicked: {
                pageStack.addPageToNextColumn(recipeOverview, recipeInfoPage)
            }

            ListItemLayout {
                title.text: "Description"
                subtitle.text: "Basic information about your brew"
                Icon {
                    name: recipeInfoPage.valid ? "tick" : "next"
                    SlotsLayout.position: SlotsLayout.Trailing;
                    width: units.gu(2)
                }
            }
        }

        ListItem {
            onClicked: {
                pageStack.addPageToNextColumn(recipeOverview, recipeSpecsPage)
            }

            ListItemLayout {
                title.text: "Specifications"
                subtitle.text: "Details such as gravity and ABV"
                Icon {
                    name: recipeSpecsPage.valid ? "tick" : "next"
                    SlotsLayout.position: SlotsLayout.Trailing;
                    width: units.gu(2)
                }
            }
        }

        ListItem {
            onClicked: {
                pageStack.addPageToNextColumn(recipeOverview, recipeFermentablesPage)
            }

            ListItemLayout {
                title.text: "Fermentables"
                subtitle.text: "Grain bill, fruit, etc."
                Icon {
                    name: "next"
                    SlotsLayout.position: SlotsLayout.Trailing;
                    width: units.gu(2)
                }
            }
        }

        ListItem {
            onClicked: {
                console.debug("GOTO Hops (Not implemented)")
            }

            ListItemLayout {
                title.text: "Hops"
                subtitle.text: "Hop types and schedule"
                Icon {
                    name: "next"
                    SlotsLayout.position: SlotsLayout.Trailing;
                    width: units.gu(2)
                }
            }
        }

        ListItem {
            onClicked: {
                console.debug("GOTO Yeast (Not implemented)")
            }

            ListItemLayout {
                title.text: "Yeast"
                subtitle.text: "Yeast varities"
                Icon {
                    name: "next"
                    SlotsLayout.position: SlotsLayout.Trailing;
                    width: units.gu(2)
                }
            }
        }

        ListItem {
            onClicked: {
                console.debug("GOTO Fermentation (Not implemented)")
            }

            ListItemLayout {
                title.text: "Fermentation"
                subtitle.text: "Timing and climate"
                Icon {
                    name: "next"
                    SlotsLayout.position: SlotsLayout.Trailing;
                    width: units.gu(2)
                }
            }
        }
    }

    RecipeInfo {
        id: recipeInfoPage
    }

    RecipeSpecifications {
      id: recipeSpecsPage
    }

    RecipeFermentables {
      id: recipeFermentablesPage
    }
}
