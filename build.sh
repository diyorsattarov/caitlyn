# build.sh
#!/bin/bash

PROJECT_NAME="caitlyn"
BUILD_DIR="build"
BUILD_TYPE="Release"

# Create build directory if it doesn't exist
mkdir -p $BUILD_DIR

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  clean     - Clean build directory"
    echo "  build     - Build the project"
    echo "  run       - Build and run the project"
    echo "  debug     - Build in debug mode"
    echo "  release   - Build in release mode (default)"
}

# Clean build directory
clean_build() {
    echo "Cleaning build directory..."
    rm -rf $BUILD_DIR/*
}

# Build the project
build_project() {
    cd $BUILD_DIR
    cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE ..
    cmake --build .
    cd ..
}

# Main script logic
case "$1" in
    "clean")
        clean_build
        ;;
    "build")
        build_project
        ;;
    "run")
        build_project
        ./$BUILD_DIR/$PROJECT_NAME
        ;;
    "debug")
        BUILD_TYPE="Debug"
        build_project
        ;;
    "release")
        BUILD_TYPE="Release"
        build_project
        ;;
    "--help"|"-h")
        show_usage
        ;;
    *)
        build_project
        ;;
esac
