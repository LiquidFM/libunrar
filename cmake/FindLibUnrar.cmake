# - Try to find libunrar
# Once done this will define
#
#  LIBUNRAR_FOUND - system has libarchive
#  LIBUNRAR_INCLUDE - the libarchive include directory
#  LIBUNRAR_LIBRARY - Link this to use libarchive
#
# Copyright (C) 2012  Dmitriy Vilkov <dav.daemon@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

include(CheckLibraryExists)
include(FindPackageHandleStandardArgs)

if (LIBUNRAR_LIBRARY AND LIBUNRAR_INCLUDE_DIR)
  # in cache already
  set(LIBUNRAR_FOUND TRUE)
else ()
    find_path (LIBUNRAR_INCLUDE
               NAMES "dll.hpp"
               PATH_SUFFIXES "libunrar"
               DOC "The Unrar include directory"
    )
    string (REGEX REPLACE "/libunrar$" "" LIBUNRAR_INCLUDE ${LIBUNRAR_INCLUDE})

    find_library (LIBUNRAR_LIBRARY
                  NAMES unrar
                  DOC "The Unrar library"
    )

  find_package_handle_standard_args(LibUnrar DEFAULT_MSG LIBUNRAR_INCLUDE LIBUNRAR_LIBRARY)

  mark_as_advanced(LIBUNRAR_INCLUDE LIBUNRAR_LIBRARY)
endif ()
