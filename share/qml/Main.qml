import QtQuick 2.4
import Ubuntu.Components 1.3

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
        primaryPage: homepage
        layouts: [
            PageColumnsLayout {
                when: width > units.gu(120)
                PageColumn {
                    minimumWidth: units.gu(30)
                    maximumWidth: units.gu(60)
                    preferredWidth: units.gu(40)
                }
                PageColumn {
                    minimumWidth: units.gu(30)
                    maximumWidth: units.gu(60)
                    preferredWidth: units.gu(40)
                }
                PageColumn {
                    fillWidth: true
                }
            },
            PageColumnsLayout {
                when: width > units.gu(80)
                PageColumn {
                    minimumWidth: units.gu(30)
                    maximumWidth: units.gu(60)
                    preferredWidth: units.gu(40)
                }
                PageColumn {
                    fillWidth: true
                }
            }
        ]
    }

    // TODO: We have to manually include the home page because of this bug:
    // https://bugs.launchpad.net/ubuntu/+source/ubuntu-ui-toolkit/+bug/1585996
    Home {
      id: homepage
    }
}
