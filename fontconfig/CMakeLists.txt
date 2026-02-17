set(conf_file 95-segoeui-hinting.conf)
set(conf_dest ${CMAKE_INSTALL_PREFIX}/share/fontconfig/conf.avail)
set(conf_link ${KDE_INSTALL_SYSCONFDIR}/fonts/conf.d)

install(FILE ${CMAKE_SOURCE_DIR}/fontconfig/${conf_file} DESTINATION ${conf_dest})
INSTALL(CODE "execute_process( \
    COMMAND ${CMAKE_COMMAND} -E create_symlink \
    ${conf_dest}/${conf_file} \
    ${conf_link}/${conf_file} \
    )"
)
