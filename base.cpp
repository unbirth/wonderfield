#include "base.h"
#include <iostream>
#include <question.h>
#include <base.h>
#include <stdio.h>
#include <fstream>
#include <cstdlib>
#include <qdebug.h>
#include <time.h>

using namespace std;

Base::Base()
{
    this->Load("input.txt");
    qDebug() << "КОНСТРУКТОР BASE";
}

Base::~Base()
{
    delete this->base;
}

void Base::Load(string filename)
{
        string a, q;
        freopen(filename.c_str(), "r", stdin);

        cin >> this->amount;
        this->base = new Question[this->amount];

        for(int i = 0; i < this->amount; i++)
        {
            getline(cin, q);
            getline(cin, a);
            this->base[i].Form(QString::fromStdString(q), QString::fromStdString(a));
        }

        fclose(stdin);
}


void Base::LoadQuestion()
{
    srand(time(NULL));
    int n = rand() % this->amount;
    while(this->base[n].wasBefore)
    {
        n = rand() % this->amount;
    }
    this->currentQuestion = this->base[n];
}

Question* Base::returnCurrentQuestion()
{
    return &currentQuestion;
}
