#include <QCoreApplication>
#include <QDebug>
#include "dbGen.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    dbGen db;

    /* Load line/station files */
    db.genLines("line_Bakerloo","Bakerloo");
    db.genLines("line_Central","Central");
    db.genLines("line_Circle","Circle");
    db.genLines("line_Hammersmith_and_City","Hammersmith_and_City");
    db.genLines("line_Jubilee","Jubilee");
    db.genLines("line_Metropolitan","Metropolitan");
    db.genLines("line_Northen","Northen");
    db.genLines("line_Picadilly","Picadilly");
    db.genLines("line_Victoria","Victoria");
    db.genLines("line_District","District");
    /* Generate services */
    db.genServices();
    /* Generate vehicles, drivers and datapoints */
    db.genDataPoints();
    /* Create csv files with the generated data */
    db.genDataBase();
    qDebug() << "DB generated";

    return a.exec();
}
