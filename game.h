#ifndef GAME_H
#define GAME_H
#include <QApplication>
#include <QQmlApplicationEngine>
#include <base.h>
#include <question.h>
#include <string>
#include <iostream>
#include <stdio.h>
using namespace std;

class Game : public QObject
{
    Q_OBJECT

private:
    Base base;
    int points;
    pair <QChar, bool> alphabet[32];
    QString playerName;

    void setPoints(int points);

public:
    Game();
    Game(QString name);
    ~Game();

public slots:
    bool guessLetter(QString letter, int multiplier);
    bool checkWord();
    int getLength();
    void resetAlphabet();
    void resetGame();
    void setName(QString name);
    QString getLetter(int index);
    QString getAnswer();
    QString getQuestion();

};

#endif // GAME_H
