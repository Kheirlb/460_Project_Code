#include "attpar.h"
#include "ui_attpar.h"

AttPar::AttPar(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::AttPar)
{
    ui->setupUi(this);
}

AttPar::~AttPar()
{
    delete ui;
}
