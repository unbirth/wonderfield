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
    wasBefore = false;
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

bool Question::CheckLetter(QChar letter)
{
    bool guessedAllLetters = true;                                  //Shows if all letters have been guessed

    for(int i = 0; i < this->answer.length(); i++)
    {
        if(letters[i].first.toLower() == letter.toLower()) letters[i].second = true;    //If letter is present, check it as guessed everywhere
        if(!letters[i].second) guessedAllLetters = false;           //At least one unguessed - check as unguessed
    }
    return guessedAllLetters;                                       //Return word state (guessed or not).
}

bool Question::CheckWord(QString word)
{
    if (word.length() != this->answer.length())
    {
        return false;
    }
    else
    {
        for (int i = 0; i < word.length(); i++)
        {
            if(letters[i].first.toLower() != word[i].toLower()) return false;
        }
    }
    return true;                                //All is clear
}
