execute_process(COMMAND "/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/message_ui/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/build/message_ui/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
