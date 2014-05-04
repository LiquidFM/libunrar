project (unrar)

# Project header
project_cxx_header (YES YES YES YES YES NO NO NO)

# 3rdparty
list (APPEND ${PROJECT_NAME}_LIBS platform)

# Definitions
add_definitions (
    -D_FILE_OFFSET_BITS=64
    -D_LARGEFILE_SOURCE
    -DLIBUNRAR_BUILD
    -DRARDLL
    -DUNRAR
    -DSILENT
)

# Sources
add_subdirectory (src)

# Target - unrar
add_library(unrar STATIC ${${PROJECT_NAME}_SOURCES})
target_link_libraries (unrar ${${PROJECT_NAME}_LIBS})

# Version
build_version_file (unrar 5.0.1)

# Documentation
add_documentation ("UnRAR" 5.0.1 "This package includes freeware Unrar C++ library (http://www.rarlab.com)")

# Install rules
install_header_files_with_prefix (unrar "libunrar" "src")
install_target (unrar)
