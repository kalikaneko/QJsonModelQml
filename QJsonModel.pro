#-------------------------------------------------
#
# Project created by QtCreator 2015-01-22T08:20:52
#
#-------------------------------------------------

CONFIG   += qt
QT       += qml quick
lessThan(QT_MAJOR_VERSION, 5): error("requires Qt 5")

TARGET = QJsonModel

SOURCES += \
    main.cpp \
    qjsonmodel.cpp

HEADERS += \
    qjsonmodel.h

RESOURCES += main.qrc







