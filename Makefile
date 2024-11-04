# Makefile
PROJECT := caitlyn
CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic
BUILD_DIR := build
SRC_DIR := src
INCLUDE_DIR := include

# Find all source files recursively
SOURCES := $(shell find $(SRC_DIR) -name '*.cpp' -or -name '*.cc')
OBJECTS := $(SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Include paths
INCLUDES := -I$(INCLUDE_DIR) -I$(SRC_DIR)

$(BUILD_DIR)/$(PROJECT): $(OBJECTS)
	@mkdir -p $(@D)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

.PHONY: clean build run

build: $(BUILD_DIR)/$(PROJECT)

run: build
	./$(BUILD_DIR)/$(PROJECT)

clean:
	rm -rf $(BUILD_DIR)
