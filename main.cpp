#include <QApplication>
#include <QQmlEngine>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <qdebug.h>
#include <iostream>
#include <string>
#include <stdio.h>
#include <windows.h>
#include <game.h>
#include <windows.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<Game>("com.me.qmlcomponents", 1, 0, "MyGame");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
