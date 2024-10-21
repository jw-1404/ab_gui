#include "SettingsManager.h"

#include <utils_app.h>
#include <utils_screen.h>
#include <utils_sysinfo.h>
#include <utils_language.h>
#include <SingleApplication>

#include <QtGlobal>
#include <QLibraryInfo>
#include <QVersionNumber>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QQuickStyle>
#include <QSurfaceFormat>

/* ************************************************************************** */

int main(int argc, char *argv[])
{
    // Hacks ///////////////////////////////////////////////////////////////////

#if defined(Q_OS_LINUX)
    // NVIDIA driver suspend&resume hack
    auto format = QSurfaceFormat::defaultFormat();
    format.setOption(QSurfaceFormat::ResetNotification);
    QSurfaceFormat::setDefaultFormat(format);
#endif

    qputenv("QT_QUICK_FLICKABLE_WHEEL_DECELERATION", "2500");

    // GUI application /////////////////////////////////////////////////////////
    SingleApplication app(argc, argv, false); // only one instance allowed
    app.setApplicationName("AlphaBetaCounter");
    app.setOrganizationName("Jianwei");
    app.setOrganizationDomain("jw");
    app.setWindowIcon(QIcon(":/assets/logo.png"));
    app.setApplicationDisplayName("Alpha/Beta 计数仪");

    // Init generic utils
    UtilsApp *utilsApp = UtilsApp::getInstance();
    UtilsScreen *utilsScreen = UtilsScreen::getInstance();
    UtilsSysInfo *utilsSysInfo = UtilsSysInfo::getInstance();
    UtilsLanguage *utilsLanguage = UtilsLanguage::getInstance();
    if (!utilsApp || !utilsScreen || !utilsSysInfo || !utilsLanguage) {
        qWarning() << "Cannot init generic utils!";
        return EXIT_FAILURE;
    }

    // Settings
    SettingsManager *settingMgr = SettingsManager::getInstance();
    if (!settingMgr) {
      qWarning() << "Cannot init app components!";
      return EXIT_FAILURE;
    }
    utilsLanguage->loadLanguage(settingMgr->getAppLanguage());

    // ThemeEngine
    qmlRegisterSingletonType(QUrl("qrc:/qml/ThemeEngine.qml"), "ThemeEngine", 1, 0, "Theme");

    // Start the UI
    QQmlApplicationEngine engine;

    QQmlContext *engine_context = engine.rootContext();
    engine_context->setContextProperty("settingsManager", settingMgr);
    engine_context->setContextProperty("utilsApp", utilsApp);
    engine_context->setContextProperty("utilsLanguage", utilsLanguage);
    engine_context->setContextProperty("utilsScreen", utilsScreen);
    engine_context->setContextProperty("utilsSysInfo", utilsSysInfo);

    // Load the main view
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty()) {
        qWarning() << "Cannot init QmlApplicationEngine!";
        return EXIT_FAILURE;
    }

    // config utils
    utilsLanguage->setQmlEngine(&engine);
    utilsApp->setQuickWindow(qobject_cast<QQuickWindow *>(engine.rootObjects().value(0)));

    // QQuickWindow must be valid at this point
    QQuickWindow *window = qobject_cast<QQuickWindow *>(engine.rootObjects().value(0));
    if (!window) return EXIT_FAILURE;

    // React to secondary instances
    QObject::connect(&app, &SingleApplication::instanceStarted, window, &QQuickWindow::show);
    QObject::connect(&app, &SingleApplication::instanceStarted, window, &QQuickWindow::raise);

    return app.exec();
}

/* ************************************************************************** */
