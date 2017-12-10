set(Boost_USE_MULTITHREADED ON)
set(BOOST_INCLUDEDIR "${CMAKE_INSTALL_PREFIX}/include/strus")
set(BOOST_LIBRARYDIR "${CMAKE_INSTALL_PREFIX}/${LIB_INSTALL_DIR}/strus")
find_package( Boost 1.53.0 COMPONENTS atomic QUIET)

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG(-std=c++11 COMPILER_SUPPORTS_CXX11 )

if( Boost_ATOMIC_FOUND )
	if (WIN32)
		find_package( Boost 1.53.0 REQUIRED COMPONENTS thread-mt system date_time atomic-mt regex )
	elseif (CMAKE_CXX_COMPILER_ID MATCHES "[Cc]lang"  AND  COMPILER_SUPPORTS_CXX11 )
		find_package( Boost 1.53.0 REQUIRED COMPONENTS thread system date_time atomic )
	else ()
		find_package( Boost 1.53.0 REQUIRED COMPONENTS thread system date_time atomic regex )
	endif()
else()
	if (WIN32)
		find_package( Boost 1.53.0 REQUIRED COMPONENTS thread-mt system date_time regex )
	elseif (CMAKE_CXX_COMPILER_ID MATCHES "[Cc]lang"  AND  COMPILER_SUPPORTS_CXX11 )
		find_package( Boost 1.53.0 REQUIRED COMPONENTS thread system date_time )
	else ()
		find_package( Boost 1.53.0 REQUIRED COMPONENTS thread system date_time regex )
	endif()
endif()

MESSAGE( STATUS "Boost includes: ${Boost_INCLUDE_DIRS}" )
MESSAGE( STATUS "Boost library directories: ${Boost_LIBRARY_DIRS}" )
MESSAGE( STATUS "Boost libraries: ${Boost_LIBRARIES}" )
