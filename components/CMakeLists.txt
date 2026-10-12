file(GLOB PUBLIC_QML "${CMAKE_CURRENT_SOURCE_DIR}/*.qml")
ecm_add_qml_module(aeroshell_components
    URI "aeroshell.components"
    VERSION 1.0
    GENERATE_PLUGIN_SOURCE
    DEPENDENCIES "aeroshell.components.private"
)
ecm_target_qml_sources(aeroshell_components SOURCES ${PUBLIC_QML})
ecm_finalize_qml_module(aeroshell_components DESTINATION ${KDE_INSTALL_QMLDIR})

file(GLOB PRIVATE_QML "${CMAKE_CURRENT_SOURCE_DIR}/private/*.qml")
ecm_add_qml_module(aeroshell_components_private
    URI "aeroshell.components.private"
    GENERATE_PLUGIN_SOURCE
    VERSION 1.0
)
ecm_target_qml_sources(aeroshell_components_private SOURCES ${PRIVATE_QML})
ecm_finalize_qml_module(aeroshell_components_private DESTINATION ${KDE_INSTALL_QMLDIR})
