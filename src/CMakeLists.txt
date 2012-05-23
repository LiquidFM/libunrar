# CMake tools
include (collect_sources)


collect_sources (src_HEADERS src_SOURCES ${CMAKE_SOURCE_DIR})


# Headers
set (libunrar_HEADERS ${libunrar_HEADERS} ${src_HEADERS} PARENT_SCOPE)


# Sources
set (libunrar_SOURCES ${libunrar_SOURCES} ${src_SOURCES} PARENT_SCOPE)
