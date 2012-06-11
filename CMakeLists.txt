cmake_minimum_required (VERSION 2.8)
project (unrar)


# Custom modules
set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake")


# Project header
include (project_cxx_header)


# Fix path delimeters
if (WIN32)
    file (TO_CMAKE_PATH ${CMAKE_INSTALL_PREFIX} CMAKE_INSTALL_PREFIX)
endif ()


# Includes


# Link directories


# Libs


# Definitions
add_definitions (
    -D_FILE_OFFSET_BITS=64
    -D_LARGEFILE_SOURCE
    -DLIBUNRAR_BUILD
    -DRARDLL
    -DUNRAR
    -DSILENT
)


# We're require at least Windows 2000 (http://msdn.microsoft.com/en-us/library/Aa383745)
if (WIN32)
    add_definitions (-D_WIN32_WINNT=0x0500 -DWINVER=0x0500)
endif ()


# Sources
add_subdirectory("src")


# Target - unrar
add_library(unrar SHARED ${unrar_SOURCES})


# Install
install (
    TARGETS unrar
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)
install (FILES ${unrar_HEADERS} DESTINATION include/libunrar)
