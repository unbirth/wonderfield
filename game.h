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
    QString playerName;
    pair <QChar, bool> alphabet[32];
    int points;
    void addPoints(int points);

public:
    Game();
    Game(QString name);
    ~Game();

public slots:
    void resetGame();
    int getLength();
    QString getQuestion();
    QString getAnswer();
    QChar getLetter(int index);
    void resetAlphabet();
    void guessLetter(QChar letter);
    void guessWord(QString word);
    int rollDice();    void setName(QString name);


};

#endif // GAME_H
