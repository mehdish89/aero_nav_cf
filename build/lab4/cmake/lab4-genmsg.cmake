# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lab4: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ilab4:/home/yifang/catkin_ws_test/src/lab4/msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lab4_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab4/msg/Motion.msg" NAME_WE)
add_custom_target(_lab4_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab4" "/home/yifang/catkin_ws_test/src/lab4/msg/Motion.msg" "geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab4/msg/Observation.msg" NAME_WE)
add_custom_target(_lab4_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab4" "/home/yifang/catkin_ws_test/src/lab4/msg/Observation.msg" "geometry_msgs/Quaternion"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(lab4
  "/home/yifang/catkin_ws_test/src/lab4/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab4
)
_generate_msg_cpp(lab4
  "/home/yifang/catkin_ws_test/src/lab4/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab4
)

### Generating Services

### Generating Module File
_generate_module_cpp(lab4
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab4
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lab4_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lab4_generate_messages lab4_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab4/msg/Motion.msg" NAME_WE)
add_dependencies(lab4_generate_messages_cpp _lab4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab4/msg/Observation.msg" NAME_WE)
add_dependencies(lab4_generate_messages_cpp _lab4_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab4_gencpp)
add_dependencies(lab4_gencpp lab4_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab4_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(lab4
  "/home/yifang/catkin_ws_test/src/lab4/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab4
)
_generate_msg_lisp(lab4
  "/home/yifang/catkin_ws_test/src/lab4/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab4
)

### Generating Services

### Generating Module File
_generate_module_lisp(lab4
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab4
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lab4_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lab4_generate_messages lab4_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab4/msg/Motion.msg" NAME_WE)
add_dependencies(lab4_generate_messages_lisp _lab4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab4/msg/Observation.msg" NAME_WE)
add_dependencies(lab4_generate_messages_lisp _lab4_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab4_genlisp)
add_dependencies(lab4_genlisp lab4_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab4_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(lab4
  "/home/yifang/catkin_ws_test/src/lab4/msg/Motion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab4
)
_generate_msg_py(lab4
  "/home/yifang/catkin_ws_test/src/lab4/msg/Observation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab4
)

### Generating Services

### Generating Module File
_generate_module_py(lab4
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab4
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lab4_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lab4_generate_messages lab4_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab4/msg/Motion.msg" NAME_WE)
add_dependencies(lab4_generate_messages_py _lab4_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yifang/catkin_ws_test/src/lab4/msg/Observation.msg" NAME_WE)
add_dependencies(lab4_generate_messages_py _lab4_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab4_genpy)
add_dependencies(lab4_genpy lab4_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab4_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab4)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab4
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(lab4_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab4)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab4
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(lab4_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab4)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab4\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab4
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(lab4_generate_messages_py geometry_msgs_generate_messages_py)
