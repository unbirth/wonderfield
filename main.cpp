#include <QApplication>
#include <QQmlApplicationEngine>
#include <iostream>
#include <string>
#include <stdio.h>
#include <windows.h>
#include <game.h>
#include <windows.h>

int main(int argc, char *argv[])
{
    Game game;

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
