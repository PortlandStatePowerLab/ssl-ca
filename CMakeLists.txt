set(COMPONENT_NAME certs)

add_custom_command(
    TARGET ${COMPONENT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_SOURCE_DIR}/certs $<TARGET_FILE_DIR:${COMPONENT_NAME}>
)
