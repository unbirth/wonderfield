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
    QString playerName;
    qlonglong points;
    Base base;
    pair <QChar, bool> alphabet[32];


public:
    Game();
    Game(QString name);
    ~Game();

public slots:
    bool guessLetter(QString letter, qint32 multiplier);
    bool checkWord();
    qint32 getLength();
    void resetAlphabet();
    void resetGame();
    void setName(QString name);
    void setPoints(qlonglong points);
    qlonglong getPoints();
    QString getLetter(qint32 index);
    QString getAnswer();
    QString getQuestion();
    QString getPrize();

};

#endif // GAME_H
