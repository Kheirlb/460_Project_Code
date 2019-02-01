#include "attpar.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    AttPar w;
    w.show();

    return a.exec();
}
