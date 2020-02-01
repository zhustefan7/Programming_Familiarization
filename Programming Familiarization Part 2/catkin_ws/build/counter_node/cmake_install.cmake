# Install script for directory: /home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/counter_node

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/counter_node/msg" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/counter_node/msg/counter_reply_msg.msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/counter_node/srv" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/counter_node/srv/counter.srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/counter_node/cmake" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/counter_node/catkin_generated/installspace/counter_node-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/include/counter_node")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/share/roseus/ros/counter_node")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/share/common-lisp/ros/counter_node")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/share/gennodejs/ros/counter_node")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/lib/python2.7/dist-packages/counter_node")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/devel/lib/python2.7/dist-packages/counter_node")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/counter_node/catkin_generated/installspace/counter_node.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/counter_node/cmake" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/counter_node/catkin_generated/installspace/counter_node-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/counter_node/cmake" TYPE FILE FILES
    "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/counter_node/catkin_generated/installspace/counter_nodeConfig.cmake"
    "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/counter_node/catkin_generated/installspace/counter_nodeConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/counter_node" TYPE FILE FILES "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/counter_node/package.xml")
endif()

