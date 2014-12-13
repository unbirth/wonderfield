#ifndef BASE_H
#define BASE_H
#include <question.h>

class Base
{
private:
    pair <Question, bool>*  base;
    QString                 hiScoreName;
    QString*                prizes;
    Question                currentQuestion;
    qint32                  amount;
    qint32                  prizeAmount;
    qint32                  lastPrize;
    qint32                  hiScore;

public:
    Base();
    ~Base();

    qint32                  getHiScore();

    Question                *returnCurrentQuestion();
    QString                 getRandomPrize();
    QString                 getHiScoreName();

    void                    Load(QString filename);
    void                    LoadPrizes(QString filename);
    void                    LoadQuestion();
    void                    LoadRecords(QString filename);
    void                    SaveRecords(QString filename);

    bool                    CheckRecord(QString name, qint32 record);
};

#endif // BASE_H
