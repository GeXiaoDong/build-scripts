#!/bin/bash

set -e

# function to build all targets
function buildTargets() 
{
BUILDCONFIG=$1
GENERATOR="$2"
TARGET=$3

mkdir -p $BUILDCONFIG
cd $BUILDCONFIG

case "$TARGET" in
	"SolARFramework")
		cmake -H../../sources/SolARFramework -B./SolARFramework -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd SolARFramework
		cmake --build . --config $BUILDCONFIG
		cmake --build . --config $BUILDCONFIG --target install
		cd ..
		;;
	"SolARModuleOpenCV")
		cmake -H../../sources/Modules/SolARModuleOpenCV -B./Modules/SolARModuleOpenCV -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleOpenCV
		cmake --build . --config $BUILDCONFIG
		cmake --build . --config $BUILDCONFIG --target install	
		cd ../..
		;;
	"SolARModuleNonFreeOpenCV")
		cmake -H../../sources/Modules/SolARModuleNonFreeOpenCV -B./Modules/SolARModuleNonFreeOpenCV -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleNonFreeOpenCV
		cmake --build . --config $BUILDCONFIG
		cmake --build . --config $BUILDCONFIG --target install	
		cd ../..
		;;
	"SolARModuleTools")
		cmake -H../../sources/Modules/SolARModuleTools -B./Modules/SolARModuleTools -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleTools
		cmake --build . --config $BUILDCONFIG
		cmake --build . --config $BUILDCONFIG --target install	
		cd ../..
		;;
	"SolARModuleOpenGL")
		cmake -H../../sources/Modules/SolARModuleOpenGL -B./Modules/SolARModuleOpenGL -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleOpenGL
		cmake --build . --config $BUILDCONFIG
		cmake --build . --config $BUILDCONFIG --target install	
		cd ../..
		;;
	"SolARModuleFBOW")
		cmake -H../../sources/Modules/SolARModuleFBOW -B./Modules/SolARModuleFBOW -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleFBOW
		cmake --build . --config $BUILDCONFIG
		cmake --build . --config $BUILDCONFIG --target install	
		cd ../..
		;;	
	"NaturalImageMarker")
		cmake -H../../sources/Samples/NaturalImageMarker/Dynamic -B./Samples/NaturalImageMarker/Dynamic -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Samples/NaturalImageMarker/Dynamic
		cmake --build . --config $BUILDCONFIG
		cd ../../..
		;;
	"FiducialMarker")
		cmake -H../../sources/Samples/FiducialMarker/Dynamic -B./Samples/FiducialMarker/Dynamic -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Samples/FiducialMarker/Dynamic
		cmake --build . --config $BUILDCONFIG
		cd ../../..
		;;
	"Sample-Slam")
		cmake -H../../sources/Samples/Sample-Slam/Mono -B./Samples/Sample-Slam/Mono -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Samples/Sample-Slam/Mono
		cmake --build . --config $BUILDCONFIG
		cd ../../..
		cmake -H../../sources/Samples/Sample-Slam/Multi -B./Samples/Sample-Slam/Multi -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Samples/Sample-Slam/Multi
		cmake --build . --config $BUILDCONFIG
		cd ../../..		
		;;
	"Sample-Triangulation")
		cmake -H../../sources/Samples/Sample-Triangulation -B./Samples/Sample-Triangulation -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Samples/Sample-Triangulation
		cmake --build . --config $BUILDCONFIG
		cd ../..
		;;				
	"SolARCameraCalibration")
		cmake -H../../sources/Modules/SolARModuleOpenCV/tests/SolARCameraCalibration/static -B./Modules/SolARModuleOpenCV/tests/SolARCameraCalibration/static -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleOpenCV/tests/SolARCameraCalibration/static
		cmake --build . --config $BUILDCONFIG
		cd ../../../../../
		;;
	"SolARDescriptorMatcher")
		cmake -H../../sources/Modules/SolARModuleOpenCV/tests/SolARDescriptorMatcher/dynamic -B./Modules/SolARModuleOpenCV/tests/SolARDescriptorMatcher/dynamic -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleOpenCV/tests/SolARDescriptorMatcher/dynamic
		cmake --build . --config $BUILDCONFIG
		cd ../../../../../
		;;
	"SolARFundamentalMatrixDecomposer")
		;;
	"SolARFundamentalMatrixEstimation")
		;;
	"SolARImageConvertor")
		cmake -H../../sources/Modules/SolARModuleOpenCV/tests/SolARImageConvertor/dynamic -B./Modules/SolARModuleOpenCV/tests/SolARImageConvertor/dynamic -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleOpenCV/tests/SolARImageConvertor/dynamic
		cmake --build . --config $BUILDCONFIG
		cd ../../../../../
		;;
	"SolARImageLoader")
		cmake -H../../sources/Modules/SolARModuleOpenCV/tests/SolARImageLoader/dynamic -B./Modules/SolARModuleOpenCV/tests/SolARImageLoader/dynamic -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleOpenCV/tests/SolARImageLoader/dynamic
		cmake --build . --config $BUILDCONFIG
		cd ../../../../../
		;;
	"SolARMatchesFilter")
		;;
	"SolARSVDtriangulation")
		cmake -H../../sources/Modules/SolARModuleOpenCV/tests/SolARSVDtriangulation -B./Modules/SolARModuleOpenCV/tests/SolARSVDtriangulation -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleOpenCV/tests/SolARSVDtriangulation
		cmake --build . --config $BUILDCONFIG
		cd ../../../../
		;;
	"SolARDescriptorExtractorNonFree")
		cmake -H../../sources/Modules/SolARModuleNonFreeOpenCV/tests/SolARDescriptorExtractor -B./Modules/SolARModuleNonFreeOpenCV/tests/SolARDescriptorExtractor -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleNonFreeOpenCV/tests/SolARDescriptorExtractor
		cmake --build . --config $BUILDCONFIG
		cd ../../../../
		;;
	"SolARDescriptorMatcherNonFree")
		cmake -H../../sources/Modules/SolARModuleNonFreeOpenCV/tests/SolARDescriptorMatcher/dynamic -B./Modules/SolARModuleNonFreeOpenCV/tests/SolARDescriptorMatcher/dynamic -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleNonFreeOpenCV/tests/SolARDescriptorMatcher/dynamic
		cmake --build . --config $BUILDCONFIG
		cd ../../../../../
		;;
	"SolARHomographyEstimationNonFree")
		cmake -H../../sources/Modules/SolARModuleNonFreeOpenCV/tests/SolARHomographyEstimation/static -B./Modules/SolARModuleNonFreeOpenCV/tests/SolARHomographyEstimation/static -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd Modules/SolARModuleNonFreeOpenCV/tests/SolARHomographyEstimation/static
		cmake --build . --config $BUILDCONFIG
		cd ../../../../../
		;;
	"UnitTests")
		cmake -H../../sources/SolARTests/unittests/ModuleLoading -B./SolARTests/unittests/ModuleLoading -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd SolARTests/unittests/ModuleLoading
		cmake --build . --config $BUILDCONFIG	
		cd ../../../
		##
		cmake -H../../sources/SolARTests/unittests/ComponentLoading -B./SolARTests/unittests/ComponentLoading -G "$GENERATOR" -DCMAKE_BUILD_TYPE=$BUILDCONFIG
		cd SolARTests/unittests/ComponentLoading
		cmake --build . --config $BUILDCONFIG
		cd ../../../
		;;
	*)
		echo "unknown target"
		return -1
		;;
esac

cd ..

return 0
}


if [ $# -lt 1 ]; then
  echo "Usage:"
  echo "$0 [target to build] [opt: cmake generator]"
  echo "ex : $0 SolARFramework"
  echo "ex : $0 all (to build all targets)"
  echo "ex : $0 clean (to delete build folder)"
  echo "ex : $0 list (to list all targets)"
  echo "ex : $0 all Ninja"
  exit -1
fi

TARGET=$1

if [ $# -lt 2 ]; then
	if [ $TARGET != "clean" ] && [ $TARGET != "list" ]; then
		# select generator
		if [ "$OSTYPE" == "msys" ]; then
			echo "Select Generator"
			options=("Visual Studio 15 2017 Win64" "Visual Studio 14 2015 Win64" "Visual Studio 12 2013 Win64" "NMake Makefiles" "NMake Makefiles JOM" "Ninja")

			select opt in "${options[@]}"; do
			    case $opt in
			        "Visual Studio 15 2017 Win64" ) generator="Visual Studio 15 2017 Win64"; break;;
			        "Visual Studio 14 2015 Win64" ) generator="Visual Studio 14 2015 Win64"; break;;
			        "Visual Studio 12 2013 Win64" ) generator="Visual Studio 12 2013 Win64"; break;;
			        "NMake Makefiles" ) generator="NMake Makefiles"; break;;
			        "NMake Makefiles JOM" ) generator="NMake Makefiles JOM"; break;;
			        "Ninja" ) generator="Ninja"; break;;
			    esac
			done
		elif [[ "$OSTYPE" = *"linux"* ]]; then
			generator="Unix Makefiles"	# default generator for unix 
		fi
	fi
else
	generator=$2
fi

mkdir -p build
cd build

case "$TARGET" in
	"all" )
		buildTargets release "$generator" SolARFramework
		buildTargets debug "$generator" SolARFramework

		buildTargets release "$generator" SolARModuleOpenCV
		buildTargets debug "$generator" SolARModuleOpenCV

		buildTargets release "$generator" SolARModuleTools
		buildTargets debug "$generator" SolARModuleTools

		#buildTargets release "$generator" SolARModuleFBOW
		#buildTargets debug "$generator" SolARModuleFBOW

		buildTargets release "$generator" SolARModuleOpenGL		
		buildTargets debug "$generator" SolARModuleOpenGL				

		buildTargets release "$generator" NaturalImageMarker
		buildTargets debug "$generator" NaturalImageMarker

		buildTargets release "$generator" FiducialMarker
		buildTargets debug "$generator" FiducialMarker

		# tests "free"
		buildTargets release "$generator" SolARCameraCalibration
		buildTargets debug "$generator" SolARCameraCalibration
		buildTargets release "$generator" SolARDescriptorMatcher
		buildTargets debug "$generator" SolARDescriptorMatcher
		buildTargets release "$generator" SolARImageConvertor
		buildTargets debug "$generator" SolARImageConvertor
		buildTargets release "$generator" SolARImageLoader
		buildTargets debug "$generator" SolARImageLoader

		#buildTargets release "$generator" SolARSVDtriangulation
		# unit tests
		#buildTargets release "$generator" UnitTests

		# tests "free"
		#buildTargets debug "$generator" SolARSVDtriangulation
		# unit tests
		#buildTargets debug "$generator" UnitTests
		;;
	"clean")
		cd ..
		rm -rf build
		;;
	"list")
		echo "Available targets:"
		echo "(Framework) 		SolARFramework" 
		echo "(Modules) 		SolARModuleOpenCV, SolARModuleNonFreeOpenCV, SolARModuleTools, SolARModuleOpenGL, SolARModuleFBOW"		
		echo "(Simple Samples)	SolARCameraCalibration, SolARDescriptorMatcher, SolARImageConvertor, SolARImageLoader, SolARSVDtriangulation"
		echo "(RA Samples)		NaturalImageMarker, FiducialMarker, Sample-Slam, Sample-Triangulation"
		echo "(Unit Tests)		UnitTests"
		;;
	"nonfree")
		buildTargets release "$generator" SolARModuleNonFreeOpenCV
		buildTargets debug "$generator" SolARModuleNonFreeOpenCV
		# tests "non free"
		buildTargets release "$generator" SolARDescriptorExtractorNonFree
		#buildTargets release "$generator" SolARDescriptorMatcherNonFree
		#buildTargets release "$generator" SolARHomographyEstimationNonFree

		buildTargets release "$generator" Sample-Triangulation
		buildTargets debug "$generator" Sample-Triangulation

		buildTargets release "$generator" Sample-Slam
		buildTargets debug "$generator" Sample-Slam	

		# tests "non free"
		buildTargets debug "$generator" SolARDescriptorExtractorNonFree
		#buildTargets debug "$generator" SolARDescriptorMatcherNonFree
		#buildTargets debug "$generator" SolARHomographyEstimationNonFree		
		;;
	*)
		buildTargets release "$generator" $TARGET
		buildTargets debug "$generator" $TARGET
		;;
esac

