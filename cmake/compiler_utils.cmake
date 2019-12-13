include(CheckCXXCompilerFlag)
function(enable_cxx_compiler_flag_if_supported flag)
    string(FIND "${CMAKE_CXX_FLAGS}" "${flag}" flag_already_set)
    if(flag_already_set EQUAL -1)
        check_cxx_compiler_flag("${flag}" flag_supported)
        if(flag_supported)
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}" PARENT_SCOPE)
        endif()
        unset(flag_supported CACHE)
    endif()
endfunction()

function(get_version version_str)
    string(REPLACE "." ";" VERSION_LIST ${version_str})
    list(GET VERSION_LIST 0 TMP_MAJOR_VERSION)
    list(GET VERSION_LIST 1 TMP_MINOR_VERSION)
    list(GET VERSION_LIST 2 TMP_PATCH_VERSION)
    set(MAJOR_VERSION ${TMP_MAJOR_VERSION} PARENT_SCOPE)
    set(MINOR_VERSION ${TMP_MINOR_VERSION} PARENT_SCOPE)
    set(PATCH_VERSION ${TMP_PATCH_VERSION} PARENT_SCOPE)
endfunction()

function(get_clang_version version_str)
    string(REPLACE "." ";" VERSION_LIST ${version_str})
    list(GET VERSION_LIST 0 TMP_MAJOR_VERSION)
    list(GET VERSION_LIST 1 TMP_MINOR_VERSION)
    list(GET VERSION_LIST 2 TMP_PATCH_VERSION)
    set(CLANG_MAJOR_VERSION ${TMP_MAJOR_VERSION} PARENT_SCOPE)
    set(CLANG_MINOR_VERSION ${TMP_MINOR_VERSION} PARENT_SCOPE)
    set(CLANG_PATCH_VERSION ${TMP_PATCH_VERSION} PARENT_SCOPE)
endfunction()
