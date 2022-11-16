#include "system.hpp"
#include "utilities/preprocessor.hpp"

System::System()
{
}

bool System::isMobile()
{
#if defined(PLATFORM_MOBILE)
    return true;
#elif defined (PLATFORM_DESKTOP)
    return false;
#else
    return false;
#endif
}

bool System::isIos()
{
#if defined(PLATFORM_IOS)
    return true;
#else
    return false;
#endif
}

bool System::isAndroid()
{
#if defined(PLATFORM_ANDROID)
    return true;
#else
    return false;
#endif
}
