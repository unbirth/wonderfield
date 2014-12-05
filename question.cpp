#include "question.h"
#include <qdebug.h>
#include <stdio.h>
#include <string.h>
#include <string.h>
using namespace std;

Question::Question()
{
    this->question = "";
    this->answer = "";
    this->length = 0;
    this->letters = new pair<QChar, bool>[answer.length()];
}

Question::~Question()
{
    delete letters;
}

void Question::Form(QString question, QString answer)
{
    this->question = question;
    this->answer = answer;
    this->length = answer.length();
    this->letters = new pair<QChar, bool>[this->length];
    for (int i = 0; i < this->length; i++)
    {
        this->letters[i].first = this->answer[i];
        this->letters[i].second = false;    //Was this letter guessed or not.
    }
}

int Question::getAmount()
{
    return this->length;
}

QString Question::getQuestion()
{
    return this->question;
}

QString Question::getAnswer()
{
    return this->answer;
}
pair<QChar, bool>* Question::getLetters()
{
    return this->letters;
}

int Question::CheckLetter(QChar letter, int points, int multiplier)
{
    bool guessedAnyLetter = false;                                  //Shows if all letters have been guessed
    int m = 0;


    for(int i = 0; i < this->answer.length(); i++)
    {
        if(letters[i].first.toLower() == letter)
        {
            letters[i].second = true;    //If letter is present, check it as guessed everywhere
            guessedAnyLetter = true;           //At least one unguessed - check as unguessed
            m += multiplier;
        }
    }
    if (guessedAnyLetter)
    {
        if(multiplier >= 100)
        {
            points += m;
            return points;
        }
        else
        {
            switch(multiplier)
            {
            case 0:
                return points;
            case 3:
                return points *= 3;
            case 5:
                return points *= 5;
            case 2:
                return points *= 2;
            }
        }
    }
    else return 0;                                     //Return word state (guessed or not).
}

bool Question::CheckWord()
{
    for(int i = 0; i < this->length; i++)
    {
        if(!this->letters[i].second) return false;
    }

    for(int i = 0; i < this->length; i++)
    {
        this->letters[i].second = false;
    }
    return true;
}
