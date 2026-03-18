cmake_minimum_required(VERSION 3.16)
project(aeroshell-workspace)

set(KF6_MIN_VERSION "6.0.0")

find_package(ECM ${KF6_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(ECMQtDeclareLoggingCategory)

set(PROJECT_VERSION "6.6.1")
set(PROJECT_VERSION_MAJOR 6)

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
# no
remove_definitions(-DQT_NO_CAST_TO_ASCII -DQT_NO_CAST_FROM_ASCII -DQT_USE_QSTRINGBUILDER)
include(FeatureSummary)
include(ECMConfiguredInstall)

find_package(Qt6 REQUIRED COMPONENTS
    Core Qml Quick DBus
)

find_package(KF6 REQUIRED COMPONENTS
    Config I18n KIO Notifications
    Service WindowSystem Package
)
find_package(KSysGuard CONFIG REQUIRED)
find_package(LibNotificationManager CONFIG REQUIRED)

find_package(LayerShellQt REQUIRED)

find_package(LibKWorkspace REQUIRED)
find_package(Plasma REQUIRED)
find_package(PlasmaQuick REQUIRED)
find_package(PlasmaActivities REQUIRED)
find_package(PlasmaActivitiesStats REQUIRED)

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/config-dirs.h.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/config-dirs.h"
    @ONLY
)

add_subdirectory(aeroshell-kcmloader)
add_subdirectory(aeroshell-splash)

add_subdirectory(autostart)
add_subdirectory(fontconfig)
add_subdirectory(mimetype)

add_subdirectory(libtaskmanager)
add_subdirectory(libshowdesktop)
add_subdirectory(libaeroshellutils)

install()

