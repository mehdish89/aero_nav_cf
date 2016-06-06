# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lab5: 0 messages, 2 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/indigo/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lab5_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab5/srv/MoveBot.srv" NAME_WE)
add_custom_target(_lab5_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab5" "/home/yifang/catkin_ws_test/src/lab5/srv/MoveBot.srv" ""
)

get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab5/srv/Position.srv" NAME_WE)
add_custom_target(_lab5_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab5" "/home/yifang/catkin_ws_test/src/lab5/srv/Position.srv" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(lab5
  "/home/yifang/catkin_ws_test/src/lab5/srv/MoveBot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab5
)
_generate_srv_cpp(lab5
  "/home/yifang/catkin_ws_test/src/lab5/srv/Position.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab5
)

### Generating Module File
_generate_module_cpp(lab5
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab5
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lab5_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lab5_generate_messages lab5_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab5/srv/MoveBot.srv" NAME_WE)
add_dependencies(lab5_generate_messages_cpp _lab5_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab5/srv/Position.srv" NAME_WE)
add_dependencies(lab5_generate_messages_cpp _lab5_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab5_gencpp)
add_dependencies(lab5_gencpp lab5_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab5_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(lab5
  "/home/yifang/catkin_ws_test/src/lab5/srv/MoveBot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab5
)
_generate_srv_lisp(lab5
  "/home/yifang/catkin_ws_test/src/lab5/srv/Position.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab5
)

### Generating Module File
_generate_module_lisp(lab5
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab5
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lab5_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lab5_generate_messages lab5_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab5/srv/MoveBot.srv" NAME_WE)
add_dependencies(lab5_generate_messages_lisp _lab5_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab5/srv/Position.srv" NAME_WE)
add_dependencies(lab5_generate_messages_lisp _lab5_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab5_genlisp)
add_dependencies(lab5_genlisp lab5_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab5_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(lab5
  "/home/yifang/catkin_ws_test/src/lab5/srv/MoveBot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab5
)
_generate_srv_py(lab5
  "/home/yifang/catkin_ws_test/src/lab5/srv/Position.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab5
)

### Generating Module File
_generate_module_py(lab5
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab5
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lab5_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lab5_generate_messages lab5_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab5/srv/MoveBot.srv" NAME_WE)
add_dependencies(lab5_generate_messages_py _lab5_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab5/srv/Position.srv" NAME_WE)
add_dependencies(lab5_generate_messages_py _lab5_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab5_genpy)
add_dependencies(lab5_genpy lab5_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab5_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab5)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab5
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(lab5_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(lab5_generate_messages_cpp nav_msgs_generate_messages_cpp)
add_dependencies(lab5_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab5)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab5
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(lab5_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(lab5_generate_messages_lisp nav_msgs_generate_messages_lisp)
add_dependencies(lab5_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab5)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab5\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab5
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(lab5_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(lab5_generate_messages_py nav_msgs_generate_messages_py)
add_dependencies(lab5_generate_messages_py geometry_msgs_generate_messages_py)
