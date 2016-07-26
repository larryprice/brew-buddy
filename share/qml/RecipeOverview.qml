import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief RecipeOverview page for defining brew ingredients
*/

Page {
    id: recipeOverview
    header: PageHeader {
        title: beerName === "" ? i18n.tr("New Beer") : beerName
    }
    property string beerName: ""

    Component.onCompleted: {
        var timer = Qt.createQmlObject("import QtQuick 2.3; Timer {interval: 0; repeat: false; running: true;}", recipeOverview, "MyTimer");
        timer.triggered.connect(function(){
            recipeOverview.pageStack.addPageToNextColumn(recipeOverview, Qt.resolvedUrl("RecipeInfo.qml"))
        });
    }

    Column {
        spacing: units.gu(2)
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: recipeOverview.header.bottom
            topMargin: parent.height / 4
        }

        Button {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: "Description"
            onClicked: pageStack.addPageToNextColumn(recipeOverview, Qt.resolvedUrl("RecipeInfo.qml"))
            color: theme.palette.normal.positive

            width: units.gu(30)
        }

        Button {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: "Specifications"
            onClicked: print("specs - not implemented")
            color: theme.palette.normal.positive

            width: units.gu(30)
        }

        Button {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: "Ingredients"
            onClicked: pageStack.addPageToNextColumn(recipeOverview, Qt.resolvedUrl("RecipeFermentables.qml"))
            color: theme.palette.normal.positive

            width: units.gu(30)
        }

        Button {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: "Let's Brew This!"
            onClicked: print("brew it to it - not implmented")
            color: theme.palette.normal.positive

            width: units.gu(30)
        }
    }
}
