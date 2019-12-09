#ifndef DBGEN_H
#define DBGEN_H

#include <QObject>
#include <QFile>
#include <QVector>
#include "LatLong-UTMconversion..h"

#define VEHICLES_NUMBER         80

#define DRIVERS_NUMBER          80

#define SERVICES_NUMBER         100

#define MEAN_SPEED              50.0
#define KMH_TO_MPS              0.277777778
#define MPS_TP_KMH              3.6

#define START_TIME_MORNING      1548655200

#define START_DATA              20181001

#define DATA_POINTS_NUMBER      1

#define DATA_POINT_START_TIME   1548662400//    1548673973//1548685433//1548673973//1548671153//1548663053//1548714300//1548662400//1548665100
#define TIME_INCREMENT          10

class dbGen : public QObject
{
    Q_OBJECT
public:
    explicit dbGen(QObject *parent = nullptr);
    void genLines(QString fileName, QString lineName);
    void genDrivers(QString fileName, int drvInVehicle, int drvNa, int drvInStation);
    void genVehicles(int vclParked, int vclInMaint, int vclInUse, int vclOoo);
    void genServices();
    void genDataPoints();
    void genTravels();
    void genDataBase();
    QVector<int> uniqueRandGen(int size, int min, int max);


    struct station{
        QString name;
        double lat;
        double lon;
        double utmNorthing;
        double utmEasting;
    };
    QVector<station> stations;

    struct stationService{
        QString stationName;
        QString lineName;
        int serviceNumber;
        long long time;
    };
    QVector<stationService> stationServices;

    struct vehicle{
        QString type;
        int id;
        QString status;
    };
    QVector<vehicle> vehicles;

    struct service{
        QString line;
        int number;
        QList<QString> stations;
        QVector<double> distance;
        QVector<long long> time;
    };
    QVector<service> services;

    struct driver{
        QString name;
        QString password;
        QString currentPos;
        QList<QString> skills;
        QString mobile;
    };
    QVector<driver> drivers;

    struct dataPoint{
        int vehicleIdInUse;
        QString line;
        int serviceNumber;
        QString date;
        int time;
        double lat;
        double lon;
        double utmNorthing;
        double utmEasting;
        double speed;
    };
    QVector<dataPoint> dataPoints;
    QVector<QVector<dataPoint>> allDataPoints;

    struct travel{
        int vehicleId;
        QString line;
        int serviceNumber;
        QString date;
        QString driver;
        double distance;
        double totalDelay;
    };
    QVector<travel> travels;

    struct line{
        QString lineName;
        QList<QString> stations;
    };
    QVector<line> lines;

    QString trainTypes[4] = {"Gulliver", "Ganzmovac", "Mantagi", "Kiwirail"};
    QString trainStatus[4] = {"Parked", "maintenance", "In use", "Out of order"};

    QList<QString> namesList;

    QVector<int> trainsInUse;


signals:

public slots:

private:

};

#endif // DBGEN_H
