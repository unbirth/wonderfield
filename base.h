#ifndef BASE_H
#define BASE_H
#include <question.h>

class Base
{
private:
    Question* base;
    Question currentQuestion;
    int amount;

public:
    Base();
    ~Base();

    Question returnCurrentQuestion();

    void Load(string filename);
    void LoadQuestion();
};

#endif // BASE_H
