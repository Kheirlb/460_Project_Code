#ifndef ATTPAR_H
#define ATTPAR_H

#include <QMainWindow>

namespace Ui {
class AttPar;
}

class AttPar : public QMainWindow
{
    Q_OBJECT

public:
    explicit AttPar(QWidget *parent = nullptr);
    ~AttPar();

private:
    Ui::AttPar *ui;
};

#endif // ATTPAR_H
