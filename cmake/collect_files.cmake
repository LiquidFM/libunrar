# Copyright (C) 2012  Dmitriy Vilkov <dav.daemon@gmail.com>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file COPYING-CMAKE-SCRIPTS for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.

function (collect_files THIS_FILES FILES_MASK RELATIVE_DIR)
    # "THIS_FILES" and "RELATIVE_DIR" contains names of the actual variables passed into here.
    
    if (NOT RELATIVE_DIR)
        set (RELATIVE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
    endif()
    
    file (GLOB_RECURSE files_0 RELATIVE ${RELATIVE_DIR} FOLLOW_SYMLINKS ${FILES_MASK})
    set (${THIS_FILES} ${${THIS_FILES}} ${files_0} PARENT_SCOPE)
    
endfunction (collect_files)
