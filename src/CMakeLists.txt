# CMake tools
include (platform/collect_files)

collect_files (src_HEADERS "*.h" ${CMAKE_SOURCE_DIR})
collect_files (src_HEADERS "*.hpp" ${CMAKE_SOURCE_DIR})
set (unrar_HEADERS ${src_HEADERS} PARENT_SCOPE)

set (unrar_SOURCES ${unrar_SOURCES}
    src/rar.cpp
    src/strlist.cpp
    src/strfn.cpp
    src/pathfn.cpp
    src/smallfn.cpp
    src/global.cpp
    src/file.cpp
    src/filefn.cpp
    src/filcreat.cpp
    src/archive.cpp
    src/arcread.cpp
    src/unicode.cpp
    src/system.cpp
    src/isnt.cpp
    src/crypt.cpp
    src/crc.cpp
    src/rawread.cpp
    src/encname.cpp
    src/resource.cpp
    src/match.cpp
    src/timefn.cpp
    src/rdwrfn.cpp
    src/consio.cpp
    src/options.cpp
    src/errhnd.cpp
    src/rarvm.cpp
    src/secpassword.cpp
    src/rijndael.cpp
    src/getbits.cpp
    src/sha1.cpp
    src/sha256.cpp
    src/blake2s.cpp
    src/hash.cpp
    src/extinfo.cpp
    src/extract.cpp
    src/volume.cpp
    src/list.cpp
    src/find.cpp
    src/unpack.cpp
    src/headers.cpp
    src/threadpool.cpp
    src/rs16.cpp
    src/cmddata.cpp
    src/ui.cpp
    src/filestr.cpp
    src/scantree.cpp
    src/dll.cpp
    src/qopen.cpp
PARENT_SCOPE)
