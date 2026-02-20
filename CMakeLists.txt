cmake_minimum_required(VERSION 3.16)
project(aeroshell-workspace)

set(KF6_MIN_VERSION "6.0.0")

find_package(ECM ${KF6_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(ECMQtDeclareLoggingCategory)

set(PROJECT_VERSION "6.5.4")
set(PROJECT_VERSION_MAJOR 6)

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)

find_package(Qt6 REQUIRED COMPONENTS
    Core Qml Quick DBus
)

find_package(KF6 REQUIRED COMPONENTS
    Config I18n KIO Notifications
    Service WindowSystem
)
find_package(KSysGuard CONFIG REQUIRED)
find_package(LibNotificationManager CONFIG REQUIRED)

find_package(Plasma REQUIRED)
find_package(PlasmaActivities REQUIRED)
find_package(PlasmaActivitiesStats REQUIRED)

add_subdirectory(aeroshell-kcmloader)
add_subdirectory(fontconfig)
add_subdirectory(mimetype)
add_subdirectory(libtaskmanager)
add_subdirectory(libshowdesktop)

install()

