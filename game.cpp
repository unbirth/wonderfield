#include "game.h"
#include <qdebug.h>
#include <iostream>
#include <stdio.h>
#include <base.h>
#include <string>
#include <cstdlib>
#include <time.h>
#include <qfile.h>

using namespace std;


qint32 countPoints(qint32 length)
{
    qint32 a = 100, b = 100;
    for(qint32 i = 0; i < length; i++)
    {
        a < b ? a += b : b += a;
    }
    return max(a, b);
}

Game::Game()
{
    this->playerName = "Аноним Анонимыч";
    this->points = 0;
    this->resetGame();

}

Game::Game(QString name)
{
    setName(name);
    this->resetGame();
}

Game::~Game()
{

}

QString Game::getLetter(qint32 index)
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
    resetAlphabet();
}

void Game::resetAlphabet()
{
    QString s = "абвгдежзийклмнопрстуфхцчшщьыъэюя";
    for(qint32 i = 0; i <= 32; i++)
    {
        this->alphabet[i].first = s[i];
        this->alphabet[i].second = false;
    }
   // qDebug() << this->base.returnCurrentQuestion()->getQuestion() << this->base.returnCurrentQuestion()->getAnswer();
}

bool Game::addRecord(QString name, qint32 record)
{
    return this->base.CheckRecord(name, record);
}

qint32 Game::getLength()
{
    return this->base.returnCurrentQuestion()->getAmount();
}

void Game::setName(QString name)
{
    this->playerName = name;
}

void Game::setPoints(qlonglong points)
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

bool Game::guessLetter(QString letter, qint32 multiplier)
{
    for(qint32 i = 0; i < 33; i++)
    {
        if(this->alphabet[i].first == letter[0].toLower() && !this->alphabet[i].second)
        {
            setPoints(this->base.returnCurrentQuestion()->CheckLetter(letter[0].toLower(), this->points, multiplier));
            return true;
        }
    }
    return false;
}

qint32 Game::guessWord(QString word)
{
    if(word == this->base.returnCurrentQuestion()->getAnswer())
    {
        qint32 counter = 0;
        for(qint32 i = 0; i < word.length(); i++)
        {
            if (!this->base.returnCurrentQuestion()->getLetters()[i].second)
            {
                counter++;
            }
        }
        return countPoints(counter);
    }
    return 0;
}

void Game::saveGame()
{
    this->base.SaveRecords("records.txt");
}

qint32 Game::getHighScore()
{
    return this->base.getHiScore();
}

QString Game::getHighScoreName()
{
    return this->base.getHiScoreName();
}

bool Game::checkWord()
{
    return this->base.returnCurrentQuestion()->CheckWord();
}

qlonglong Game::getPoints()
{
    return this->points;
}

QString Game::getPrize()
{
    return this->base.getRandomPrize();
}
