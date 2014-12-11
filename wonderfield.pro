TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    base.cpp \
    game.cpp \
    question.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    base.h \
    game.h \
    question.h

CONFIG += console
