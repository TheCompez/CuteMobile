#ifndef SYSTEM_HPP
#define SYSTEM_HPP

#include <QObject>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isMobile READ isMobile CONSTANT)
    Q_PROPERTY(bool isAndroid READ isAndroid CONSTANT)
    Q_PROPERTY(bool isIos READ isIos CONSTANT)
public:
    System();
    bool isMobile();
    bool isAndroid();
    bool isIos();
};

#endif // SYSTEM_HPP
