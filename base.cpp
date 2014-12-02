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
        this->base = new pair <Question, bool>[this->amount];

        for(int i = 0; i < this->amount; i++)
        {
            getline(cin, q);
            getline(cin, a);
            this->base[i].first.Form(QString::fromStdString(q), QString::fromStdString(a));
        }

        fclose(stdin);
}


void Base::LoadQuestion()
{
    srand(time(NULL));
    int n = rand() % this->amount;
    for(int i = 0; i < this->amount; i++)
    {
        if (!this->base[i].second) break;
        else if (i == this->amount - 1)
        {
            for(int j = 0; j < this->amount; j++)
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
