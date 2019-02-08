/********************************************************************************
** Form generated from reading UI file 'attpar.ui'
**
** Created by: Qt User Interface Compiler version 5.12.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_ATTPAR_H
#define UI_ATTPAR_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPlainTextEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_AttPar
{
public:
    QWidget *centralWidget;
    QWidget *horizontalLayoutWidget_2;
    QHBoxLayout *horizontalLayout_2;
    QVBoxLayout *verticalLayout_2;
    QPushButton *pushButton;
    QTableWidget *tableWidget;
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QComboBox *comboBox;
    QLabel *label_2;
    QComboBox *comboBox_2;
    QLabel *label_3;
    QPlainTextEdit *plainTextEdit;
    QVBoxLayout *verticalLayout_3;
    QHBoxLayout *horizontalLayout;
    QPushButton *pushButton_3;
    QPushButton *pushButton_2;
    QTableWidget *tableWidget_2;

    void setupUi(QMainWindow *AttPar)
    {
        if (AttPar->objectName().isEmpty())
            AttPar->setObjectName(QString::fromUtf8("AttPar"));
        AttPar->resize(976, 281);
        centralWidget = new QWidget(AttPar);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        horizontalLayoutWidget_2 = new QWidget(centralWidget);
        horizontalLayoutWidget_2->setObjectName(QString::fromUtf8("horizontalLayoutWidget_2"));
        horizontalLayoutWidget_2->setGeometry(QRect(10, 10, 951, 261));
        horizontalLayout_2 = new QHBoxLayout(horizontalLayoutWidget_2);
        horizontalLayout_2->setSpacing(6);
        horizontalLayout_2->setContentsMargins(11, 11, 11, 11);
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        horizontalLayout_2->setContentsMargins(0, 0, 0, 0);
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        pushButton = new QPushButton(horizontalLayoutWidget_2);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));

        verticalLayout_2->addWidget(pushButton);

        tableWidget = new QTableWidget(horizontalLayoutWidget_2);
        tableWidget->setObjectName(QString::fromUtf8("tableWidget"));

        verticalLayout_2->addWidget(tableWidget);


        horizontalLayout_2->addLayout(verticalLayout_2);

        verticalLayout = new QVBoxLayout();
        verticalLayout->setSpacing(6);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        label = new QLabel(horizontalLayoutWidget_2);
        label->setObjectName(QString::fromUtf8("label"));

        verticalLayout->addWidget(label);

        comboBox = new QComboBox(horizontalLayoutWidget_2);
        comboBox->addItem(QString());
        comboBox->addItem(QString());
        comboBox->addItem(QString());
        comboBox->addItem(QString());
        comboBox->addItem(QString());
        comboBox->addItem(QString());
        comboBox->setObjectName(QString::fromUtf8("comboBox"));

        verticalLayout->addWidget(comboBox);

        label_2 = new QLabel(horizontalLayoutWidget_2);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        verticalLayout->addWidget(label_2);

        comboBox_2 = new QComboBox(horizontalLayoutWidget_2);
        comboBox_2->addItem(QString());
        comboBox_2->addItem(QString());
        comboBox_2->addItem(QString());
        comboBox_2->addItem(QString());
        comboBox_2->addItem(QString());
        comboBox_2->addItem(QString());
        comboBox_2->setObjectName(QString::fromUtf8("comboBox_2"));

        verticalLayout->addWidget(comboBox_2);

        label_3 = new QLabel(horizontalLayoutWidget_2);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        verticalLayout->addWidget(label_3);

        plainTextEdit = new QPlainTextEdit(horizontalLayoutWidget_2);
        plainTextEdit->setObjectName(QString::fromUtf8("plainTextEdit"));

        verticalLayout->addWidget(plainTextEdit);


        horizontalLayout_2->addLayout(verticalLayout);

        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setSpacing(6);
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        pushButton_3 = new QPushButton(horizontalLayoutWidget_2);
        pushButton_3->setObjectName(QString::fromUtf8("pushButton_3"));

        horizontalLayout->addWidget(pushButton_3);

        pushButton_2 = new QPushButton(horizontalLayoutWidget_2);
        pushButton_2->setObjectName(QString::fromUtf8("pushButton_2"));

        horizontalLayout->addWidget(pushButton_2);


        verticalLayout_3->addLayout(horizontalLayout);

        tableWidget_2 = new QTableWidget(horizontalLayoutWidget_2);
        tableWidget_2->setObjectName(QString::fromUtf8("tableWidget_2"));

        verticalLayout_3->addWidget(tableWidget_2);


        horizontalLayout_2->addLayout(verticalLayout_3);

        AttPar->setCentralWidget(centralWidget);

        retranslateUi(AttPar);

        QMetaObject::connectSlotsByName(AttPar);
    } // setupUi

    void retranslateUi(QMainWindow *AttPar)
    {
        AttPar->setWindowTitle(QApplication::translate("AttPar", "AttPar", nullptr));
        pushButton->setText(QApplication::translate("AttPar", "Read From Input File", nullptr));
        label->setText(QApplication::translate("AttPar", "Convert From:", nullptr));
        comboBox->setItemText(0, QApplication::translate("AttPar", "Principal Angle/Axis", nullptr));
        comboBox->setItemText(1, QApplication::translate("AttPar", "DCM - Direction Cosine Matrix", nullptr));
        comboBox->setItemText(2, QApplication::translate("AttPar", "Quaternions", nullptr));
        comboBox->setItemText(3, QApplication::translate("AttPar", "Eular Angles", nullptr));
        comboBox->setItemText(4, QApplication::translate("AttPar", "Gibbs Vector", nullptr));
        comboBox->setItemText(5, QApplication::translate("AttPar", "Cayley-Klein", nullptr));

        label_2->setText(QApplication::translate("AttPar", "To:", nullptr));
        comboBox_2->setItemText(0, QApplication::translate("AttPar", "DCM - Direction Cosine Matrix", nullptr));
        comboBox_2->setItemText(1, QApplication::translate("AttPar", "Principal Angle/Axis", nullptr));
        comboBox_2->setItemText(2, QApplication::translate("AttPar", "Quaternions", nullptr));
        comboBox_2->setItemText(3, QApplication::translate("AttPar", "Eular Angles", nullptr));
        comboBox_2->setItemText(4, QApplication::translate("AttPar", "Gibbs Vector", nullptr));
        comboBox_2->setItemText(5, QApplication::translate("AttPar", "Cayley-Klein", nullptr));

        label_3->setText(QApplication::translate("AttPar", "Command History:", nullptr));
        pushButton_3->setText(QApplication::translate("AttPar", "Perform Conversion", nullptr));
        pushButton_2->setText(QApplication::translate("AttPar", "Send to File", nullptr));
    } // retranslateUi

};

namespace Ui {
    class AttPar: public Ui_AttPar {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ATTPAR_H
