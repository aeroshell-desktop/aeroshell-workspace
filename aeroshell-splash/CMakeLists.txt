set(aeroshell-splash_SRCS
    main.cpp
    splashapp.cpp splashapp.h
    splashwindow.cpp splashwindow.h
   )

add_executable(aeroshell-splash ${aeroshell-splash_SRCS})

target_link_libraries(aeroshell-splash
    Qt::Quick
    Qt::DBus
    KF6::ConfigCore
    KF6::Package
    KF6::WindowSystem
    Plasma::PlasmaQuick
    PW::KWorkspace
    LayerShellQt::Interface
)

ecm_qt_declare_logging_category(aeroshell-splash
   HEADER debug.h
   IDENTIFIER KSPLASHQML_DEBUG
   CATEGORY_NAME aeroshell.splash
   DESCRIPTION "aeroshell-splash debug"
)

install(TARGETS aeroshell-splash ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
install(FILES org.kde.KSplash.xml DESTINATION ${KDE_INSTALL_DBUSINTERFACEDIR})

ecm_install_configured_files(INPUT aeroshell-splash.conf.in DESTINATION ${KDE_INSTALL_SYSCONFDIR}/systemd/user/plasma-ksplash.service.d/)
