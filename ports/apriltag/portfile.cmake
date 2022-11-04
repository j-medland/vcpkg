vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO j-medland/apriltag
    REF cb08284602fefe27531d344334f4493e7058eaa9
    SHA512 711f46f0dab2263996609cc2e94ea6cc0a88d10c2da1f36fbb74cf1f5c4027db5610d53bad3368e5c148dc570b209c8f873a326582e31f3c37e66d42003ede7a
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
    -DBUILD_EXAMPLES=OFF
    -DBUILD_PYTHON_WRAPPER=OFF
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_cmake_config_fixup(CONFIG_PATH "share/${PORT}/cmake")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")