# Copyright (C) 2012  Dmitriy Vilkov <dav.daemon@gmail.com>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file COPYING-CMAKE-SCRIPTS for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#
#
# Project build type identification
#
# This script will set the following variables:
#    BUILD_TYPE_IS_NOT_SET
#    BUILD_TYPE_IS_DEBUG
#    BUILD_TYPE_IS_RELEASE
#    BUILD_TYPE_WITH_DEBUG_INFO
#    BUILD_TYPE_MIN_SIZE
#    


if (DEFINED CMAKE_BUILD_TYPE AND NOT CMAKE_BUILD_TYPE STREQUAL "")
    string (TOUPPER ${CMAKE_BUILD_TYPE} BUILD_TYPE)
    
    if (BUILD_TYPE STREQUAL "DEBUG")
    
        set (CMAKE_BUILD_TYPE "Debug")
        set (BUILD_TYPE_IS_DEBUG "YES")
        
    elseif (BUILD_TYPE STREQUAL "RELEASE")
    
        set (CMAKE_BUILD_TYPE "Release")
        set (BUILD_TYPE_IS_RELEASE "YES")
        
    elseif (BUILD_TYPE STREQUAL "RELWITHDEBINFO")

        set (CMAKE_BUILD_TYPE "RelWithDebInfo")
        set (BUILD_TYPE_IS_RELEASE "YES")
        set (BUILD_TYPE_WITH_DEBUG_INFO "YES")

    elseif (BUILD_TYPE STREQUAL "MINSIZEREL")

        set (CMAKE_BUILD_TYPE "MinSizeRel")
        set (BUILD_TYPE_IS_RELEASE "YES")
        set (BUILD_TYPE_MIN_SIZE "YES")
        
    else ()
    
        message (FATAL_ERROR "Unknown CMAKE_BUILD_TYPE value (\"${CMAKE_BUILD_TYPE}\")!")
    
    endif ()
else ()

    set (BUILD_TYPE_IS_NOT_SET "YES")

endif ()


#
# Set up compiler flags according to the given arguments and BUILD_TYPE:
#    ARGV0 - compiler flags
#    ARGV1 - compiler name (i.e. "C" or "CXX"), if empty both compiler flags
#        variables will be set.
#
function (set_compiler_flags)
    
    if (DEFINED ARGV1)
        if (BUILD_TYPE_IS_NOT_SET)
            set (CMAKE_${ARGV1}_FLAGS ${ARGV0} PARENT_SCOPE)
        elseif (BUILD_TYPE_IS_DEBUG)
            set (CMAKE_${ARGV1}_FLAGS_DEBUG ${ARGV0} PARENT_SCOPE)
        elseif (BUILD_TYPE_IS_RELEASE)
            if (BUILD_TYPE_WITH_DEBUG_INFO)
                set (CMAKE_${ARGV1}_FLAGS_RELWITHDEBINFO ${ARGV0} PARENT_SCOPE)
            elseif (BUILD_TYPE_MIN_SIZE)
                set (CMAKE_${ARGV1}_FLAGS_MINSIZEREL ${ARGV0} PARENT_SCOPE)
            else ()
                set (CMAKE_${ARGV1}_FLAGS_RELEASE ${ARGV0} PARENT_SCOPE)
            endif ()
        endif ()
    else ()
        if (BUILD_TYPE_IS_NOT_SET)
            set (CMAKE_C_FLAGS ${ARGV0} PARENT_SCOPE)
            set (CMAKE_CXX_FLAGS ${ARGV0} PARENT_SCOPE)
        elseif (BUILD_TYPE_IS_DEBUG)
            set (CMAKE_C_FLAGS_DEBUG ${ARGV0} PARENT_SCOPE)
            set (CMAKE_CXX_FLAGS_DEBUG ${ARGV0} PARENT_SCOPE)
        elseif (BUILD_TYPE_IS_RELEASE)
            if (BUILD_TYPE_WITH_DEBUG_INFO)
                set (CMAKE_C_FLAGS_RELWITHDEBINFO ${ARGV0} PARENT_SCOPE)
                set (CMAKE_CXX_FLAGS_RELWITHDEBINFO ${ARGV0} PARENT_SCOPE)
            elseif (BUILD_TYPE_MIN_SIZE)
                set (CMAKE_C_FLAGS_MINSIZEREL ${ARGV0} PARENT_SCOPE)
                set (CMAKE_CXX_FLAGS_MINSIZEREL ${ARGV0} PARENT_SCOPE)
            else ()
                set (CMAKE_C_FLAGS_RELEASE ${ARGV0} PARENT_SCOPE)
                set (CMAKE_CXX_FLAGS_RELEASE ${ARGV0} PARENT_SCOPE)
            endif ()
        endif ()
    endif ()
    
endfunction ()
