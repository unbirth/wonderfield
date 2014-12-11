#ifndef BASE_H
#define BASE_H
#include <question.h>

class Base
{
private:
    pair <Question, bool>*  base;
    QString*                prizes;
    Question                currentQuestion;
    qint32                  amount;
    qint32                  prizeAmount;
    qint32                  lastPrize;

public:
    Base();
    ~Base();

    Question                *returnCurrentQuestion();

    QString                 getRandomPrize();

    void                    Load(QString filename);
    void                    LoadPrizes(QString filename);
    void                    LoadQuestion();
};

#endif // BASE_H
