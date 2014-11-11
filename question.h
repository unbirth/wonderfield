#ifndef QUESTION_H
#define QUESTION_H
#include <string>

using namespace std;

class Question                                      //В этом классе хранится один вопрос
{
private:
    string question;                                //Вопрос
    string answer;                                  //Ответ
    int length;                                     //Длина ответа
    pair <char, bool>* letters;                     //Пары: буква слова - была ли угадана


public:
    Question();
    ~Question();                                    //Массив у нас один - letters, очищаем память

    bool wasBefore;                                 //Было ли это слово загадано ранее
    void Form(string question, string answer);      //Формируем новый вопрос, грубо говоря - конструктор с параметрами
    void ShowQuestion();                            //Вывод на экран, отладочная функция
    bool CheckLetter(char letter);                  //Угадывание буквы;         todo: доработать эту функцию
    bool CheckWord(string word);                    //Угадывание целого слова;  todo: дописать
    //TODO test

};

#endif // QUESTION_H
