#include "question.h"
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
    this->letters = new pair<char, bool>[answer.length()];
}

Question::~Question()
{
    delete letters;
}

void Question::Form(string question, string answer)
{
    this->question = question;
    this->answer = answer;
    this->length = answer.length();
    this->letters = new pair<char, bool>[this->length];
    for (int i = 0; i < this->length; i++)
    {
        this->letters[i].first = this->answer[i];
        this->letters[i].second = false;    //Was this letter guessed or not.
    }
}

void Question::ShowQuestion()
{
    printf("Q:%s\n", this->question.c_str());
    printf("A:%s\n", this->answer.c_str());
    printf("Letters:\n");
    for(int i = 0; i < this->length; i++ )
    {
        printf("[%c] = %d\n", this->letters[i].first, this->letters[i].second); //Printing pairs 'letter - was it shown or not'
    }
}

bool Question::CheckLetter(char letter)
{
    bool guessedAllLetters = true;                                  //Shows if all letters have been guessed

    for(int i = 0; i < this->answer.length(); i++)
    {
        if(tolower(letters[i].first) == tolower(letter)) letters[i].second = true;    //If letter is present, check it as guessed everywhere
        if(!letters[i].second) guessedAllLetters = false;           //At least one unguessed - check as unguessed
    }
    return guessedAllLetters;                                       //Return word state (guessed or not).
}

bool Question::CheckWord(string word)
{
    if (word.length() != this->answer.length())
    {
        return false;
    }
    else
    {
        for (int i = 0; i < word.length(); i++)
        {
            if(tolower(letters[i].first) != tolower(word[i])) return false;
        }
    }
    return true;                                //All is clear
}
