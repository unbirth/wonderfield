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
    int length;                                     //Длина ответа
    pair <QChar, bool>* letters;                     //Пары: буква слова - была ли угадана


public:
    Question();
    ~Question();                                    //Массив у нас один - letters, очищаем память

    bool wasBefore;                                 //Было ли это слово загадано ранее
    void Form(QString question, QString answer);      //Формируем новый вопрос, грубо говоря - конструктор с параметрами
    QString getQuestion();                            //Вывод на экран, отладочная функция
    bool CheckLetter(QChar letter);                  //Угадывание буквы;         todo: доработать эту функцию
    bool CheckWord(QString word);                    //Угадывание целого слова;  todo: дописать
    int getAmount();
    QString getAnswer();
    pair <QChar, bool>* getLetters();


};

#endif // QUESTION_H
