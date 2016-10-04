#-------------------------------------------------
#
# Project created by QtCreator 2016-10-01T17:34:28
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = CmWidget1
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui

DISTFILES += \
    .travis.yml \
    ci/ci-install-linux.sh \
    ci/ci-install-osx.sh \
    ci/ci-build-linux.sh \
    ci/ci-build-osx.sh
