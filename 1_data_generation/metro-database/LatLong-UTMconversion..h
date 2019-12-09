#ifndef LATLONGTOUTMCONVERSION_H
#define LATLONGTOUTMCONVERSION_H

#include <QString>


void LLtoUTM(int ReferenceEllipsoid, const double Lat, const double Long,
             double &UTMNorthing, double &UTMEasting, QString &UTMZone);

void UTMtoLL(int ReferenceEllipsoid, const double UTMNorthing, const double UTMEasting, const QString UTMZone,
              double& Lat,  double& Long );

char UTMLetterDesignator(double Lat);


class Ellipsoid
{
public:
    Ellipsoid() {}
    Ellipsoid(int Id, QString name, double radius, double ecc)
    {
        id = Id;
        ellipsoidName = name;
        EquatorialRadius = radius;
        eccentricitySquared = ecc;
    }

    int id;
    QString ellipsoidName;
    double EquatorialRadius;
    double eccentricitySquared;

};


static Ellipsoid ellipsoid[] =
{
    Ellipsoid( -1, "Placeholder", 0, 0),
    Ellipsoid( 1,  "Airy", 6377563, 0.00667054),
    Ellipsoid( 2,  "Australian National", 6378160, 0.006694542),
    Ellipsoid( 3,  "Bessel 1841", 6377397, 0.006674372),
    Ellipsoid( 4,  "Bessel 1841 (Nambia) ", 6377484, 0.006674372),
    Ellipsoid( 5,  "Clarke 1866", 6378206, 0.006768658),
    Ellipsoid( 6,  "Clarke 1880", 6378249, 0.006803511),
    Ellipsoid( 7,  "Everest", 6377276, 0.006637847),
    Ellipsoid( 8,  "Fischer 1960 (Mercury) ", 6378166, 0.006693422),
    Ellipsoid( 9,  "Fischer 1968", 6378150, 0.006693422),
    Ellipsoid( 10, "GRS 1967", 6378160, 0.006694605),
    Ellipsoid( 11, "GRS 1980", 6378137, 0.00669438),
    Ellipsoid( 12, "Helmert 1906", 6378200, 0.006693422),
    Ellipsoid( 13, "Hough", 6378270, 0.00672267),
    Ellipsoid( 14, "International", 6378388, 0.00672267),
    Ellipsoid( 15, "Krassovsky", 6378245, 0.006693422),
    Ellipsoid( 16, "Modified Airy", 6377340, 0.00667054),
    Ellipsoid( 17, "Modified Everest", 6377304, 0.006637847),
    Ellipsoid( 18, "Modified Fischer 1960", 6378155, 0.006693422),
    Ellipsoid( 19, "South American 1969", 6378160, 0.006694542),
    Ellipsoid( 20, "WGS 60", 6378165, 0.006693422),
    Ellipsoid( 21, "WGS 66", 6378145, 0.006694542),
    Ellipsoid( 22, "WGS-72", 6378135, 0.006694318),
    Ellipsoid( 23, "WGS-84", 6378137, 0.00669438)
};

#endif // LATLONGTOUTMCONVERSION_H
