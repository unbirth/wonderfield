#include "base.h"
#include <iostream>
#include <question.h>
#include <base.h>
#include <stdio.h>
#include <fstream>
#include <cstdlib>
#include <qdebug.h>
#include <time.h>
#include <qfile.h>

using namespace std;

Base::Base()
{
    this->Load("input.txt");
    this->LoadPrizes("prizes.txt");
    lastPrize = -1;
}

Base::~Base()
{
    delete this->base;
}

void Base::LoadPrizes(QString filename)
{
    QString prize;
    QFile file(filename);
    QTextStream in(&file);
    qint32 i = 0;

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    while (!in.atEnd())
    {
        prize = in.readLine();
        i++;
    }

    this->prizeAmount = i;
    this->prizes = new QString [prizeAmount];

    in.seek(0);

    i = 0;
    while (!in.atEnd())
    {
        prize = in.readLine();
        this->prizes[i] = prize;
        i++;
    }
}

QString Base::getRandomPrize()
{
    qint32 number = rand()%this->prizeAmount;
    while(number == this->lastPrize)
    {
        number = rand()%this->prizeAmount;
    }
    lastPrize = number;
    return this->prizes[number];
}

void Base::Load(QString filename)
{
    QString a, q;
    QFile file(filename);
    QTextStream in(&file);
    qint32 i = 0;

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    while (!in.atEnd())
    {
        q = in.readLine();
        a = in.readLine();
        i++;
    }

    this->amount = i;
    this->base = new pair <Question, bool>[this->amount];

    in.seek(0);

    i = 0;
    while (!in.atEnd())
    {
        q = in.readLine();
        a = in.readLine();
        this->base[i].first.Form(q, a);
        i++;
    }
}


void Base::LoadQuestion()
{
    srand(time(NULL));
    qint32 n = rand() % this->amount;
    for(qint32 i = 0; i < this->amount; i++)
    {
        if (!this->base[i].second) break;
        else if (i == this->amount - 1)
        {
            for(qint32 j = 0; j < this->amount; j++)
                this->base[i].second = false;
        }
    }
    while(this->base[n].second)
    {
        n = rand() % this->amount;
    }
    this->base[n].second = true;
    this->currentQuestion = this->base[n].first;
}

Question* Base::returnCurrentQuestion()
{
    return &currentQuestion;
}
