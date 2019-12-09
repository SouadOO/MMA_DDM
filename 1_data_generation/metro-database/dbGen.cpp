#include "dbGen.h"
#include <QDebug>
#include <QList>
#include <QString>
#include <QtMath>
#include <qdatetime.h>
#include <unistd.h>

dbGen::dbGen(QObject *parent) : QObject(parent)
{

}

void dbGen::genLines(QString fileName, QString lineName)
{
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)){
        qDebug() << "Error opening " << fileName;
        return;
    }
    struct line tempLine;
    tempLine.lineName = lineName;
    while (!file.atEnd()) {
        QByteArray line = file.readLine();
        QString strLine = QString(line);
        strLine.remove('\r');
        strLine.remove('\n');
        QStringList list1 = strLine.split(',');
        if(list1.size() > 2){
            tempLine.stations.append(list1.at(0));
            bool isAlreadyStation = false;
            for(auto stat : stations){
                if(stat.name == list1.at(0)){
                    isAlreadyStation = true;
                }
            }
            if(!isAlreadyStation){
                struct station tempStation;
                tempStation.name = list1.at(0);
                double utmEasting, utmNorthing;
                QString utmZone;
                LLtoUTM(32,list1.at(1).toDouble(),list1.at(2).toDouble(),utmNorthing,utmEasting,utmZone);
                tempStation.lat = list1.at(1).toDouble();
                tempStation.lon = list1.at(2).toDouble();
                if(tempStation.lon < 0){
                    utmEasting = utmEasting - 416098;
                }
                tempStation.utmNorthing = utmNorthing;
                tempStation.utmEasting = utmEasting;
                stations.push_back(tempStation);
            }
        }
    }
    lines.push_back(tempLine);
}

void dbGen::genDrivers(QString fileName, int drvInVehicle, int drvNa, int drvInStation)
{
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)){
        qDebug() << "Error opening " << fileName;
        return;
    }
    while (!file.atEnd()) {
        QByteArray line = file.readLine();
        QString strLine = QString(line);
        strLine.remove('\r');
        strLine.remove('\n');
        QStringList list1 = strLine.split(',');
        struct driver tempDriver;
        if(list1.size() > 2){
            tempDriver.name = list1.at(2);
            tempDriver.password = list1.at(1);
            tempDriver.mobile = list1.at(0);
            int skillsNbr = 1 + qrand() % 4;
            QVector<int> skills = uniqueRandGen(skillsNbr, 0, 4);
            for(auto s : skills)
                tempDriver.skills.push_back(trainTypes[s]);
        }
        drivers.push_back(tempDriver);
    }
    QVector<int> driverType = uniqueRandGen(DRIVERS_NUMBER, 0, DRIVERS_NUMBER);
    int v=0;
    int k=0;
    for(int i=0; i < drvInVehicle; i++) {
        driver candidate = drivers[driverType.at(v)];
        bool hasSkill = false;
        for(auto sk : candidate.skills) {
            if(sk == vehicles.at(trainsInUse.at(k)).type) {
                hasSkill = true;
            }
        }
        if(!hasSkill){
            drivers[driverType.at(v)].skills.push_back(vehicles.at(trainsInUse.at(k)).type);
        }
        drivers[driverType.at(v)].currentPos = "In vehicle nbr: " + QString::number(vehicles.at(trainsInUse.at(k)).id);
        v++;
        k++;
    }
    for(int i=0; i < drvNa; i++) {
        drivers[driverType.at(v)].currentPos = "NA";
        v++;
    }
    int s=0;
    QVector<int> inStation = uniqueRandGen(drvInStation, 0, stations.size());
    for(int i=0; i < drvInStation; i++) {
        drivers[driverType.at(v)].currentPos = "In station: " + stations.at(s).name;
        s++;
        v++;
    }
}

void dbGen::genVehicles(int vclParked, int vclInMaint, int vclInUse, int vclOoo)
{
    for(int i=0; i<VEHICLES_NUMBER; i++) {
        vehicle tempVehicle;
        tempVehicle.id = i+1;
        QVector<int> trainType = uniqueRandGen(1, 0, 4);
        tempVehicle.type = trainTypes[trainType.at(0)];
        vehicles.push_back(tempVehicle);
    }
    QVector<int> trainType = uniqueRandGen(VEHICLES_NUMBER, 0, VEHICLES_NUMBER);
    int v = 0;
    for(int i=0; i < vclParked; i++) {
        vehicles[trainType.at(v)].status = trainStatus[0];
        v++;
    }
    for(int i=0; i < vclInMaint; i++){
        vehicles[trainType.at(v)].status = trainStatus[1];
        v++;
    }
    for(int i=0; i < vclInUse; i++){
        vehicles[trainType.at(v)].status = trainStatus[2];
        trainsInUse.push_back(trainType.at(v));
        v++;
    }
    for(int i=0; i < vclOoo; i++){
        vehicles[trainType.at(v)].status = trainStatus[3];
        v++;
    }
}

void dbGen::genServices()
{
    int serviceNbr = 1;
    for(auto line : lines){
        service tempServiceAndata;
        tempServiceAndata.number = serviceNbr;
        serviceNbr++;
        tempServiceAndata.line = line.lineName;
        tempServiceAndata.stations = line.stations;
        QString startingStation = tempServiceAndata.stations.at(0);
        double utmNorthingStartStation = 0.0, utmEastingStartStation = 0.0;
        double oldDistance = 0;
        for(auto s : stations){
            if(startingStation == s.name){
                utmNorthingStartStation = s.utmNorthing;
                utmEastingStartStation = s.utmEasting;
            }
        }
        for(auto st : tempServiceAndata.stations){
            for(auto s : stations){
                if(s.name == st){
                    double distance = oldDistance + qSqrt(qPow(utmNorthingStartStation - s.utmNorthing, 2) + pow(utmEastingStartStation - s.utmEasting, 2));
                    int time = static_cast<int>(static_cast<double>(distance)/static_cast<double>(MEAN_SPEED*KMH_TO_MPS));
                    utmNorthingStartStation = s.utmNorthing;
                    utmEastingStartStation = s.utmEasting;
                    oldDistance = distance;
                    tempServiceAndata.distance.push_back(distance);
                    tempServiceAndata.time.push_back(time);
                }
            }
        }

        service tempServiceRitorno;
        tempServiceRitorno.number = serviceNbr;
        serviceNbr++;
        tempServiceRitorno.line = line.lineName;
        QList<QString> reversedLine = line.stations;
        std::reverse(reversedLine.begin(), reversedLine.end());
        tempServiceRitorno.stations = reversedLine;
        startingStation = tempServiceRitorno.stations.at(0);
        oldDistance = 0;
        for(auto s : stations){
            if(startingStation == s.name){
                utmNorthingStartStation = s.utmNorthing;
                utmEastingStartStation = s.utmEasting;
            }
        }
        for(auto st : tempServiceRitorno.stations){
            for(auto s : stations){
                if(s.name == st){
                    double distance = oldDistance + qSqrt(qPow(utmNorthingStartStation - s.utmNorthing, 2) + pow(utmEastingStartStation - s.utmEasting, 2));
                    int time = static_cast<int>(static_cast<double>(distance)/static_cast<double>(MEAN_SPEED*KMH_TO_MPS));
                    utmNorthingStartStation = s.utmNorthing;
                    utmEastingStartStation = s.utmEasting;
                    oldDistance = distance;
                    tempServiceRitorno.distance.push_back(distance);
                    tempServiceRitorno.time.push_back(time);
                }
            }
        }
        for(int i=0; i<50; i++){
            services.push_back(tempServiceAndata);
            tempServiceAndata.number = tempServiceAndata.number+2;
            services.push_back(tempServiceRitorno);
            tempServiceRitorno.number = tempServiceRitorno.number+2;
        }
        serviceNbr+= 98;
    }
    int kounter = 0;
    for(int t=0; t<10; t++){
        int startTime = START_TIME_MORNING;
        for(int i=0; i<10; i++){
            int timeIncrement = 0;
            for(int j=0; j<5; j++){
                int time = startTime + timeIncrement;
                services[kounter].time[0] = time;
                kounter++;
                services[kounter].time[0] = time;
                kounter++;
                timeIncrement+= 24*60;
            }
            startTime = startTime + 120*60;
        }
    }
    for(int j=0; j< services.size(); j++){
        for(int i=1;i<services[j].time.size(); i++){
            services[j].time[i]+= services[j].time[0];
        }
    }
    for(auto st : stations){
        for(auto sv : services){
            if(st.name == sv.stations.at(0)){
                stationService tempStationService;
                tempStationService.stationName = sv.stations.at(0);
                tempStationService.lineName = sv.line;
                tempStationService.serviceNumber = sv.number;
                tempStationService.time = sv.time.at(0);
                stationServices.push_back(tempStationService);
            }
        }
    }
}

void dbGen::genDataPoints()
{
    int dataa = START_DATA;
    int counter = 0;
    int time = DATA_POINT_START_TIME;
    for(int k=0;k<DATA_POINTS_NUMBER;k++){
        QVector<dataPoint> tempDataPoints;
        QList<service> activeServices;
        QVector<int> ti;
        for(auto service : services){
            for(int t=0; t < service.time.size()-1; t++){
                if(time > service.time.at(t) &&  time < service.time.at(t+1)){
                    activeServices.push_back(service);
                    ti.push_back(t);
                }
            }
        }
        int vclInUse = activeServices.size();
        int vclParked = (VEHICLES_NUMBER - vclInUse)/2;
        int vclInMaint = (VEHICLES_NUMBER - vclInUse - vclParked)/2;
        int vclOoo = VEHICLES_NUMBER - vclInUse - vclParked - vclInMaint;
        if(vclParked < 0)
            vclParked = 0;
        if(vclInMaint < 0)
            vclInMaint = 0;
        if(vclOoo < 0)
            vclOoo = 0;
        genVehicles(vclParked,vclInMaint,vclInUse,vclOoo);

        int drvInVehicle = activeServices.size();
        int drvInStation = (DRIVERS_NUMBER - drvInVehicle)/2;
        int drvNa = DRIVERS_NUMBER - drvInVehicle - drvInStation;
        if(drvInStation < 0)
            drvInStation = 0;
        if(drvNa < 0)
            drvNa = 0;

        genDrivers("drivers_names",drvInVehicle,drvNa,drvInStation);

        QVector<int> vIdInUse;
        for(auto v : vehicles){
            if(v.status == "In use"){
                vIdInUse.push_back(v.id);
            }
        }
        int vehicle=0;
        for(int i=0; i < activeServices.size(); i++){
            dataPoint tempDataPoint;
            tempDataPoint.serviceNumber = activeServices.at(i).number;
            tempDataPoint.time = time;
            tempDataPoint.line = activeServices.at(i).line;
            tempDataPoint.vehicleIdInUse = vIdInUse[vehicle];
            vehicle++;
            QVector<int> distError = uniqueRandGen(1, -50, 50);
            double dist = activeServices.at(i).distance.at(ti.at(i)) + MPS_TP_KMH * 10 * (time - activeServices.at(i).time.at(ti.at(i)));
            dist+= distError.at(0);
            double orgNorth = 0.0, orgEast = 0.0, aftNorth = 0.0, aftEast = 0.0;
            for(auto st : stations){
                if(st.name == activeServices.at(i).stations.at(ti.at(i))){
                    orgNorth =  st.utmNorthing;
                    orgEast =  st.utmEasting;
                }
                if(st.name == activeServices.at(i).stations.at(ti.at(i)+1)){
                    aftNorth =  st.utmNorthing;
                    aftEast =  st.utmEasting;
                }
            }
            double theta = qAtan2(aftEast - orgEast, aftNorth - orgNorth);
            theta = qRadiansToDegrees(theta);
            theta = 90 - theta;
            if(theta < 0)
            {
                theta += 360.0;
            }
            tempDataPoint.utmNorthing = orgNorth + (dist - activeServices.at(i).distance.at(ti.at(i)))*qCos(theta);
            tempDataPoint.utmEasting = orgEast + (dist - activeServices.at(i).distance.at(ti.at(i)))*qSin(theta);
            QVector<int> speed = uniqueRandGen(1, 0, 60);
            tempDataPoint.speed = speed.at(0);
            tempDataPoints.push_back(tempDataPoint);

            travel tempTravel;
            tempTravel.line = tempDataPoint.line;
            tempTravel.serviceNumber = tempDataPoint.serviceNumber;
            tempTravel.vehicleId = tempDataPoint.vehicleIdInUse;
            tempTravel.date = QString::number(dataa);
            for(auto dr : drivers){
                QString ttv = dr.currentPos;
                ttv.remove(0,16);
                int val = ttv.toInt();
                if(val == tempDataPoint.vehicleIdInUse){
                    tempTravel.driver = dr.name;
                }
            }
            for(auto sss : services){
                if(sss.number == tempDataPoint.serviceNumber){
                    tempTravel.distance = sss.distance.at(sss.distance.size()-1);
                }
            }
            QVector<int> delay = uniqueRandGen(1, 0, 50);
            tempTravel.totalDelay = delay.at(0);
            travels.push_back(tempTravel);
        }
        dataa++;
        allDataPoints.push_back(tempDataPoints);

        time+= TIME_INCREMENT;
        counter++;
        qDebug() << "data point nbr : " << counter << " generated";
    }
}

void dbGen::genDataBase()
{

    QString filename;

    filename = "serviceStation.csv";
    QFile serviceStationFile(filename);
    if(serviceStationFile.open(QFile::WriteOnly |QFile::Truncate))
    {
        QTextStream output(&serviceStationFile);
        for(auto ss : stations){
            output << "'" << ss.name << "'" << ";";
            output << "[";
            for(auto svst : stationServices){
                if(ss.name == svst.stationName){
                    output << "{";
                    QDateTime myDateTime;
                    myDateTime.setTime_t(svst.time - 3600);
                    QString str = myDateTime.toString("hhmmss");
                    output << str << ",";
                    output << svst.serviceNumber << ",";
                    output << "'" << svst.lineName << "'},";
                }
            }
            output << "]\n";
        }
        serviceStationFile.close();
    }
    filename = "driver.csv";
    QFile driverFile(filename);
    if(driverFile.open(QFile::WriteOnly |QFile::Truncate))
    {
        QTextStream output(&driverFile);
        for(auto drv : drivers){
            output << drv.name << ";";
            output << drv.password << ";";
            output << drv.currentPos << ";";
            for(int i=0;i<drv.skills.size()-1;i++)
                output << drv.skills.at(i) << ",";
            output << drv.skills.at(drv.skills.size()-1) << ";";
            output << drv.mobile;
            output << "\n";
        }
        driverFile.close();
    }

    filename = "station.csv";
    QFile stationFile(filename);
    if(stationFile.open(QFile::WriteOnly |QFile::Truncate))
    {
        QTextStream output(&stationFile);
        for(auto stn : stations){
            output << stn.name << ";";
            output << QString::number(stn.utmNorthing,'g', 10) << ";";
            output << QString::number(stn.utmEasting,'g', 10);
            output << "\n";
        }
        stationFile.close();
    }

    filename = "vehicle.csv";
    QFile vehicleFile(filename);
    if(vehicleFile.open(QFile::WriteOnly |QFile::Truncate))
    {
        QTextStream output(&vehicleFile);
        for(auto vcl : vehicles){
            output << vcl.type << ";";
            output << vcl.id << ";";
            output << vcl.status;
            output << "\n";
        }
        vehicleFile.close();
    }

    filename = "service.csv";
    QFile serviceFile(filename);
    if(serviceFile.open(QFile::WriteOnly |QFile::Truncate))
    {
        QTextStream output(&serviceFile);
        for(auto srv : services){
            output << "'" << srv.line << "'" << ",";
            output << srv.number << ",";
            output << "[";
            for(int i=0;i<srv.stations.size()-1;i++){
                output << "{";
                QDateTime myDateTime;
                myDateTime.setTime_t(srv.time.at(i) - 3600);
                QString str = myDateTime.toString("hhmmss");
                output << str << ",";
                output  << "'" << srv.stations.at(i)  << "'" << ",";
                output << srv.distance.at(i);
                output << "},";
            }
            output << "{";
            QDateTime myDateTime;
            myDateTime.setTime_t(srv.time.at(srv.stations.size()-1) - 3600);
            QString str = myDateTime.toString("hhmmss");
            output << str << ",";
            output << "'" << srv.stations.at(srv.stations.size()-1) << "'" << ",";
            output << srv.distance.at(srv.stations.size()-1);
            output << "}]";
            output << "\n";
        }
        serviceFile.close();
    }

    filename = "datapoints.csv";
    QFile dataPointFile(filename);
    if(dataPointFile.open(QFile::WriteOnly |QFile::Truncate))
    {
        QTextStream output(&dataPointFile);
        for(auto allDp : allDataPoints){
            for(auto dp : allDp){
                output << dp.vehicleIdInUse << ";";
                output << dp.line << ";";
                output << dp.serviceNumber << ";";
                output << "20190128" << ";";
                QDateTime myDateTime;
                myDateTime.setTime_t(dp.time - 3600);
                QString str = myDateTime.toString("hhmmss");
                output << str << ";";
                output << QString::number(dp.utmNorthing,'g', 10) << ";";
                output << QString::number(dp.utmEasting,'g', 10) << ";";
                output << dp.speed;
                output << "\n";
            }
        }
        dataPointFile.close();
    }

    filename = "travels.csv";
    QFile travelsFile(filename);
    if(travelsFile.open(QFile::WriteOnly |QFile::Append))
    {
        QTextStream output(&travelsFile);
        for(auto tv : travels){
            output << tv.vehicleId << ";";
            output << tv.line << ";";
            output << tv.serviceNumber << ";";
            output << tv.date << ";";
            output << tv.driver << ";";
            output << tv.distance << ";";
            output << tv.totalDelay;
            output << "\n";
        }
        travelsFile.close();
    }

}

QVector<int> dbGen::uniqueRandGen(int size, int min, int max)
{
    usleep(1000);
    QVector<int> generated;
    for(int i=0;i<size;i++){
        while(true){
            bool isAlready = false;
            QTime time = QTime::currentTime();
            qsrand((uint)time.msec());
            int num = min + qrand() % max;
            for(auto t : generated){
                if(num == t){
                    isAlready = true;
                }
            }
            if(!isAlready){
                generated.push_back(num);
                break;
            }
        }
    }
    return generated;
}


