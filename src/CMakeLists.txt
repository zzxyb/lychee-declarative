set(QT_QML_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(KF_DEP_VERSION "5.240.0")

find_package(ECM REQUIRED NO_MODULE)
find_package(PkgConfig REQUIRED)
pkg_check_modules(PipeWire IMPORTED_TARGET libpipewire-0.3 REQUIRED)
pkg_check_modules(EGL IMPORTED_TARGET egl REQUIRED)
pkg_check_modules(Epoxy IMPORTED_TARGET epoxy REQUIRED)
pkg_check_modules(LibDRM IMPORTED_TARGET libdrm REQUIRED)

find_package(Qt6 6.4 COMPONENTS Quick Core Qml REQUIRED)

find_package(Doxygen)
if (DOXYGEN_FOUND)
    set(DOXYGEN_INPUT ${CMAKE_SOURCE_DIR}/doc/Doxyfile.in)
    set(DOXYGEN_OUTPUT_DIR ${CMAKE_BINARY_DIR}/doc)
    configure_file(${DOXYGEN_INPUT} ${CMAKE_BINARY_DIR}/Doxyfile @ONLY)
    add_custom_target(doc ${DOXYGEN_EXECUTABLE} ${CMAKE_BINARY_DIR}/Doxyfile
                      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
                      COMMENT "Generating API documentation with Doxygen" VERBATIM)
# Finally, execute "make doc" or "cmake --build <build_dir> --target doc" in the compilation directory to generate Doxygen documentation.
endif ()

set(declarative_SRCS
    declarativeglobal.h
    declarativeglobal.cpp
    dualkawasebluritem_p.h
    dualkawasebluritem.h
    dualkawasebluritem.cpp
    themeimageitem_p.h
    themeimageitem.h
    themeimageitem.cpp
)

set(control_QMLS
    qml/Switch.qml
    qml/SearchBox.qml
#    qml/CheckBox.qml
#    qml/ComboBox.qml
#    qml/RadioButton.qml
#    qml/SpinBox.qml
#    qml/Slider.qml
)

#add picture resource
set(image_RSRCS
#    image/switch/switch-handle.png
)

foreach(file IN LISTS control_QMLS image_RSRCS)
    get_filename_component(filename ${file} NAME)
    set_source_files_properties(${file} PROPERTIES QT_RESOURCE_ALIAS ${filename})
endforeach()

qt_add_qml_module(declarative
    URI org.lychee.declarative
    VERSION 1.0
    SOURCES ${declarative_SRCS}
    QML_FILES ${control_QMLS}
    RESOURCES ${image_RSRCS}
)

set_target_properties(declarative PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(declarative
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(declarative PRIVATE
    Qt6::Quick
    Qt6::QuickPrivate
    PkgConfig::PipeWire
    PkgConfig::EGL
    PkgConfig::Epoxy
    PkgConfig::LibDRM
)

target_include_directories(declarative PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Prevent EGL headers from including platform headers, in particular Xlib.h.
add_definitions(-DMESA_EGL_NO_X11_HEADERS)
add_definitions(-DEGL_NO_X11)
add_definitions(-DEGL_NO_PLATFORM_SPECIFIC_TYPES)

function(get_qml_install_dir target_var)
    get_target_property(QT6_QMAKE_EXECUTABLE Qt6::qmake IMPORTED_LOCATION)
    execute_process(
        COMMAND ${QT6_QMAKE_EXECUTABLE} -query QT_INSTALL_QML
        OUTPUT_VARIABLE QML_INSTALL_DIR
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    set(${target_var} ${QML_INSTALL_DIR} PARENT_SCOPE)
endfunction()

get_qml_install_dir(QML_INSTALL_DIR)

install(TARGETS declarative DESTINATION CMAKE_INSTALL_LIBDIR)
install(FILES 
    qmldir 
    ${CMAKE_BINARY_DIR}/org/lychee/declarative/libdeclarativeplugin.so 
    ${CMAKE_BINARY_DIR}/org/lychee/declarative/declarative.qmltypes 
    DESTINATION ${QML_INSTALL_DIR}/org/lychee/declarative/
)
