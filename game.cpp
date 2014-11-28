#include "game.h"
#include <qdebug.h>
#include <iostream>
#include <stdio.h>
#include <base.h>
#include <string>
#include <cstdlib>
#include <time.h>

using namespace std;

int countPoints(int length)
{

    int a = 100, b = 100;
    for(int i = 1; i <= length; i++)
    {
        a < b ? a += b : b += a;
    }
    return max(a, b);
}

Game::Game()
{
    qDebug() << "КОНСТРУКТОР ВЫЗВАЛСЯ!";
    this->playerName = "Аноним Анонимыч";
    this->resetGame();
}

Game::Game(QString name)
{
    setName(name);
    this->resetGame();
}

Game::~Game()
{
    //delete alphabet;
}

QChar Game::getLetter(int index)
{
    if(this->base.returnCurrentQuestion()->getLetters()[index].second)
    {
        return this->base.returnCurrentQuestion()->getLetters()[index].first;
    }
    else return '*';
}

void Game::resetGame()
{
    this->base.LoadQuestion();
    this->points = 0;
    qDebug() << "RESET GAME";
    resetAlphabet();
}

void Game::resetAlphabet()
{
    QString s = "абвгдежзийклмнопрстуфхцчшщьыъэюя";
    for(int i = 0; i <= 32; i++)
    {
        this->alphabet[i].first = s[i];
        this->alphabet[i].second = false;
    }
   // qDebug() << this->base.returnCurrentQuestion()->getQuestion() << this->base.returnCurrentQuestion()->getAnswer();
}

int Game::getLength()
{
    return this->base.returnCurrentQuestion()->getAmount();
}

void Game::setName(QString name)
{
    this->playerName = name;
}

void Game::addPoints(int points)
{
    this->points += points;
}

QString Game::getQuestion()
{
    return this->base.returnCurrentQuestion()->getQuestion();
}

QString Game::getAnswer()
{
    return this->base.returnCurrentQuestion()->getAnswer();
}

int Game::rollDice()
{
    srand(time(NULL));
    int value = 720 + rand()%720;
    return value;
}

void Game::guessLetter(QChar letter)
{
    for(int i = 0; i < 33; i++)
    {
        if(this->alphabet[i].first == letter && !this->alphabet[i].second)
        {
            if(this->base.returnCurrentQuestion()->CheckLetter(letter))
            {
                addPoints(10);
            }
            else
            {
                //TODO: Bad bonus
            }
        }
    }
}

void Game::guessWord(QString word)
{
    if (this->base.returnCurrentQuestion()->CheckWord(word))
    {
        addPoints(countPoints(word.length()));
    }
    else
    {
        //TODO: Game over
    }
}
