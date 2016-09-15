project (unrar)

# Project header
project_header_default ("POSITION_INDEPENDENT_CODE:YES" "EXCEPTIONS:YES")

# Definitions
add_definitions (-D_FILE_OFFSET_BITS=64
                 -D_LARGEFILE_SOURCE
                 -DLIBUNRAR_BUILD
                 -DRARDLL
                 -DUNRAR
                 -DSILENT)

# Sources
add_subdirectory (src)

# Target - unrar
add_library (unrar SHARED ${${PROJECT_NAME}_SOURCES})

# Documentation
add_documentation ("UnRAR" 5.0.1 "This package includes freeware Unrar C++ library (http://www.rarlab.com)")

# Install rules
install_header_files_with_prefix (unrar "libunrar" "src")
install_cmake_files ("cmake/FindLibUnrar.cmake")
install_target (unrar)
