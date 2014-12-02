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

QString Game::getLetter(int index)
{
    if(this->base.returnCurrentQuestion()->getLetters()[index].second)
    {
        QString t = this->base.returnCurrentQuestion()->getLetters()[index].first.toLower();
        return t;
    }
    else return " ";
}

void Game::resetGame()
{
    this->base.LoadQuestion();
    this->points = 0;
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

void Game::setPoints(int points)
{
    this->points = points;
}

QString Game::getQuestion()
{
    return this->base.returnCurrentQuestion()->getQuestion();
}

QString Game::getAnswer()
{
    return this->base.returnCurrentQuestion()->getAnswer();
}

bool Game::guessLetter(QString letter, int multiplier)
{
    for(int i = 0; i < 33; i++)
    {
        if(this->alphabet[i].first == letter[0].toLower() && !this->alphabet[i].second)
        {
            if(this->base.returnCurrentQuestion()->CheckLetter(letter[0].toLower(), multiplier))
            {
                setPoints(this->base.returnCurrentQuestion()->getPoints());
                return true;

            }
            else
            {
                //TODO: Bad bonus
                return false;
            }
        }
    }
    return false;
}

bool Game::checkWord()
{
    return this->base.returnCurrentQuestion()->CheckWord();
}

