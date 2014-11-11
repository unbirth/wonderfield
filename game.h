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
private:
    Base base;
    string playerName;
    pair <char, bool> alphabet[26];
    int points;

public:
    Game();
    Game(string name);
    ~Game();
    void setName(string name);
    void addPoints(int points);
    void resetGame();
    void resetAlphabet();
    void guessLetter(char letter);
    void guessWord(string word);
    int rollDice();
};

#endif // GAME_H
