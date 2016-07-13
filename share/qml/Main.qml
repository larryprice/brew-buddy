import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Themes 1.3

/*!
    \brief MainView initiaiting navigation components, et al
*/

MainView {
    objectName: "mainView"
    applicationName: "brew-buddy.larryprice"

    width: units.gu(100)
    height: units.gu(75)

    AdaptivePageLayout {
        anchors.fill: parent
        primaryPageSource: Qt.resolvedUrl("Home.qml")
    }
}
