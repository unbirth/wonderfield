#ifndef QUESTION_H
#define QUESTION_H
#include <string>
#include <QApplication>
#include <QQmlApplicationEngine>


using namespace std;

class Question                                      //В этом классе хранится один вопрос
{
private:
    QString question;                                //Вопрос
    QString answer;                                  //Ответ
    qint32 length;                                     //Длина ответа
    pair <QChar, bool>* letters;                     //Пары: буква слова - была ли угадана

public:
    Question();
    ~Question();                                    //Массив у нас один - letters, очищаем память

    void Form(QString question, QString answer);      //Формируем новый вопрос, грубо говоря - конструктор с параметрами
    QString getQuestion();                            //Вывод на экран, отладочная функция
    qint32 CheckLetter(QChar letter, qint32 points, qint32 multiplier);                  //Угадывание буквы;         todo: доработать эту функцию
    bool CheckWord();                    //Угадывание целого слова;  todo: дописать
    qint32 getAmount();
    QString getAnswer();
    pair <QChar, bool>* getLetters();


};

#endif // QUESTION_H
