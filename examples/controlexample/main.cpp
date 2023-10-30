#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QString qmlPath = QGuiApplication::applicationDirPath();
#ifdef Q_OS_LINUX
    qmlPath.replace(QString::fromUtf8("examples/") + QCoreApplication::applicationName(), QString::fromUtf8(""));
#endif

    engine.addImportPath(qmlPath);

    const QUrl url(u"qrc:/example/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
