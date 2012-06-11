# CMake tools
include ("collect_files")

collect_files (src_HEADERS "*.hpp" ${CMAKE_SOURCE_DIR})
set (unrar_HEADERS ${src_HEADERS} PARENT_SCOPE)

set (unrar_SOURCES ${unrar_SOURCES} 
    src/filestr.cpp
    src/scantree.cpp
    src/dll.cpp
    src/rar.cpp
    src/strlist.cpp
    src/strfn.cpp
    src/pathfn.cpp
    src/savepos.cpp
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
	src/ulinks.cpp
	src/errhnd.cpp
	src/rarvm.cpp
	src/secpassword.cpp
	src/rijndael.cpp
	src/getbits.cpp
	src/sha1.cpp
	src/extinfo.cpp
	src/extract.cpp
	src/volume.cpp
	src/list.cpp
	src/find.cpp
	src/unpack.cpp
	src/cmddata.cpp
PARENT_SCOPE)
