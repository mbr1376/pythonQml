# Generated from OutrunHVAC.pro.

cmake_minimum_required(VERSION 3.16)
project(OutrunHVAC LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

if(NOT DEFINED INSTALL_EXAMPLESDIR)
  set(INSTALL_EXAMPLESDIR "examples")
endif()

set(INSTALL_EXAMPLEDIR "${INSTALL_EXAMPLESDIR}")

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)
find_package(Qt6 COMPONENTS Quick)
find_package(Qt6 COMPONENTS Quick3D)
find_package(Qt6 COMPONENTS Mqtt)
find_package(Qt6 COMPONENTS InterfaceFramework)
find_package(Qt6 COMPONENTS IfAndroidVehicleProperties)

qt_add_executable(OutrunHVAC WIN32 MACOSX_BUNDLE
    main.cpp
)
target_link_libraries(OutrunHVAC PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Mqtt
    Qt::Quick
    Qt::Quick3D
)

if (Qt6InterfaceFramework_FOUND AND Qt6IfAndroidVehicleProperties_FOUND)
    target_link_libraries(OutrunHVAC PUBLIC
        Qt::InterfaceFramework
        Qt::IfAndroidVehicleProperties
    )
endif()


# Resources:
qt6_add_big_resources(hvac OutrunHVAC.qrc)
target_sources(OutrunHVAC PRIVATE ${hvac})

set_target_properties(OutrunHVAC PROPERTIES
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

install(TARGETS OutrunHVAC
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
