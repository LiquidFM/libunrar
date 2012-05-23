# Copyright (C) 2012  Dmitriy Vilkov <dav.daemon@gmail.com>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file COPYING-CMAKE-SCRIPTS for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.


# CMake tools
include ("collect_files")


function (collect_sources THIS_HEADERS THIS_SOURCES RELATIVE_DIR)
    # "THIS_HEADERS", "THIS_SOURCES" and "RELATIVE_DIR" contains names of the actual variables passed into here.
    
    # Headers
    collect_files (src_HEADERS "*.h"   ${RELATIVE_DIR})
    collect_files (src_HEADERS "*.hh"  ${RELATIVE_DIR})
    collect_files (src_HEADERS "*.hpp" ${RELATIVE_DIR})
    collect_files (src_HEADERS "*.hxx" ${RELATIVE_DIR})
    
    if (WIN32)
        set (tmp_src_HEADERS "")
        foreach (src_HEADER ${src_HEADERS})
            if (NOT ${src_HEADER} MATCHES ".*/unix/.*")
                set (tmp_src_HEADERS ${tmp_src_HEADERS} ${src_HEADER})
            endif ()
        endforeach ()
        set (src_HEADERS ${tmp_src_HEADERS})
    elseif (UNIX)
        set (tmp_src_HEADERS "")
        foreach (src_HEADER ${src_HEADERS})
            if (NOT ${src_HEADER} MATCHES ".*/win32/.*")
                set (tmp_src_HEADERS ${tmp_src_HEADERS} ${src_HEADER})
            endif ()
        endforeach ()
        set (src_HEADERS ${tmp_src_HEADERS})
    else ()
        message (FATAL_ERROR "Unknown operational system!")
    endif ()
    set (${THIS_HEADERS} ${${THIS_HEADERS}} ${src_HEADERS} PARENT_SCOPE)
    
    
    # Sources
    collect_files (src_SOURCES "*.c"   ${RELATIVE_DIR})
    collect_files (src_SOURCES "*.cpp" ${RELATIVE_DIR})
    collect_files (src_SOURCES "*.cxx" ${RELATIVE_DIR})

    if (WIN32)
        set (tmp_src_SOURCES "")
        foreach (src_SOURCE ${src_SOURCES})
            if (NOT ${src_SOURCE} MATCHES ".*/unix/.*")
                set (tmp_src_SOURCES ${tmp_src_SOURCES} ${src_SOURCE})
            endif ()
        endforeach ()
        set (src_SOURCES ${tmp_src_SOURCES})
    elseif (UNIX)
        set (tmp_src_SOURCES "")
        foreach (src_SOURCE ${src_SOURCES})
            if (NOT ${src_SOURCE} MATCHES ".*/win32/.*")
                set (tmp_src_SOURCES ${tmp_src_SOURCES} ${src_SOURCE})
            endif ()
        endforeach ()
        set (src_SOURCES ${tmp_src_SOURCES})
    else ()
        message (FATAL_ERROR "Unknown operational system!")
    endif ()
    set (${THIS_SOURCES} ${${THIS_SOURCES}} ${src_SOURCES} PARENT_SCOPE)
    
endfunction (collect_sources)
