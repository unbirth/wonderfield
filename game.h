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
    unsigned long long points;
    pair <QChar, bool> alphabet[32];
    QString playerName;



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
    void setPoints(unsigned long long points);
    unsigned long long getPoints();
    QString getLetter(int index);
    QString getAnswer();
    QString getQuestion();

};

#endif // GAME_H
