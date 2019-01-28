/********************************************************************************
** Form generated from reading UI file 'dialog.ui'
**
** Created by: Qt User Interface Compiler version 5.12.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOG_H
#define UI_DIALOG_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>

QT_BEGIN_NAMESPACE

class Ui_Dialog
{
public:
    QLabel *current_picture;
    QPushButton *previous_photo;
    QPushButton *next_photo;
    QPushButton *buttonInfo;
    QPushButton *buttonModify;
    QPushButton *buttonThrow;

    void setupUi(QDialog *Dialog)
    {
        if (Dialog->objectName().isEmpty())
            Dialog->setObjectName(QString::fromUtf8("Dialog"));
        Dialog->resize(1335, 707);
        current_picture = new QLabel(Dialog);
        current_picture->setObjectName(QString::fromUtf8("current_picture"));
        current_picture->setGeometry(QRect(150, 80, 1051, 521));
        previous_photo = new QPushButton(Dialog);
        previous_photo->setObjectName(QString::fromUtf8("previous_photo"));
        previous_photo->setGeometry(QRect(30, 330, 80, 25));
        next_photo = new QPushButton(Dialog);
        next_photo->setObjectName(QString::fromUtf8("next_photo"));
        next_photo->setGeometry(QRect(1220, 320, 80, 25));
        buttonInfo = new QPushButton(Dialog);
        buttonInfo->setObjectName(QString::fromUtf8("buttonInfo"));
        buttonInfo->setGeometry(QRect(1070, 10, 16, 16));
        buttonModify = new QPushButton(Dialog);
        buttonModify->setObjectName(QString::fromUtf8("buttonModify"));
        buttonModify->setGeometry(QRect(1110, 10, 16, 16));
        buttonThrow = new QPushButton(Dialog);
        buttonThrow->setObjectName(QString::fromUtf8("buttonThrow"));
        buttonThrow->setGeometry(QRect(1150, 10, 16, 16));

        retranslateUi(Dialog);

        QMetaObject::connectSlotsByName(Dialog);
    } // setupUi

    void retranslateUi(QDialog *Dialog)
    {
        Dialog->setWindowTitle(QApplication::translate("Dialog", "Dialog", nullptr));
        current_picture->setText(QString());
        previous_photo->setText(QString());
        next_photo->setText(QString());
        buttonInfo->setText(QString());
        buttonModify->setText(QString());
        buttonThrow->setText(QString());
    } // retranslateUi

};

namespace Ui {
    class Dialog: public Ui_Dialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOG_H
