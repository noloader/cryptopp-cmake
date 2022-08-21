# ===-----------------------------------------------------------------------===#
# Distributed under the 3-Clause BSD License. See accompanying file LICENSE or
# copy at https://opensource.org/licenses/BSD-3-Clause).
# SPDX-License-Identifier: BSD-3-Clause
# ===-----------------------------------------------------------------------===#

include(CMakePackageConfigHelpers)

# ------------------------------------------------------------------------------
# Generate module config files for cmake and pkgconfig
# ------------------------------------------------------------------------------

function(_module_cmake_config_files)
  # generate the config file that includes the exports
  configure_package_config_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/cryptoppConfig.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/cmake/cryptopp
    PATH_VARS CRYPTOPP_VERSION)

  # generate the version file for the config file
  write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/cryptoppConfigVersion.cmake
    VERSION ${CRYPTOPP_VERSION}
    COMPATIBILITY AnyNewerVersion)
endfunction()

function(_module_pkgconfig_files)
  set(MODULE_PKGCONFIG_FILE cryptopp.pc)
  if(BUILD_SHARED)
    set(target cryptopp-shared)
  elseif(BUILD_STATIC)
    set(target cryptopp-static)
  else()
    return()
  endif()

  get_target_property(target_debug_postfix ${target} DEBUG_POSTFIX)
  if(${target_debug_postfix} MATCHES "-NOTFOUND$")
    set(target_debug_postfix "")
  endif()
  set(MODULE_LINK_LIBS "-lcryptopp${target_debug_postfix}")
  configure_file(config.pc.in
                 ${CMAKE_CURRENT_BINARY_DIR}/${MODULE_PKGCONFIG_FILE} @ONLY)
endfunction()

function(create_module_config_files)
  _module_cmake_config_files()
  _module_pkgconfig_files()
endfunction()
