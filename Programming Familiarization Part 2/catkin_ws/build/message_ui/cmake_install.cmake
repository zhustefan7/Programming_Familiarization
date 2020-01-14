# Install script for directory: /home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/message_ui

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/message_ui/msg" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/message_ui/msg/sent_msg.msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  include("/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/message_ui/catkin_generated/safe_execute_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/message_ui/cmake" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/message_ui/catkin_generated/installspace/message_ui-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/include/message_ui")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/share/roseus/ros/message_ui")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/share/common-lisp/ros/message_ui")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/share/gennodejs/ros/message_ui")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/lib/python2.7/dist-packages/message_ui")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/lib/python2.7/dist-packages/message_ui" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/lib/python2.7/dist-packages/message_ui" FILES_MATCHING REGEX "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/lib/python2.7/dist-packages/message_ui/.+/__init__.pyc?$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/message_ui/catkin_generated/installspace/message_ui.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/message_ui/cmake" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/message_ui/catkin_generated/installspace/message_ui-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/message_ui/cmake" TYPE FILE FILES
    "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/message_ui/catkin_generated/installspace/message_uiConfig.cmake"
    "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/message_ui/catkin_generated/installspace/message_uiConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/message_ui" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/message_ui/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/message_ui" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/message_ui/plugin.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/message_ui" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/message_ui/resource")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/message_ui" TYPE PROGRAM FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/message_ui/scripts/message_gui")
endif()

