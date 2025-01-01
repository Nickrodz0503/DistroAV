#!/usr/bin/env zsh

# Load the script to be tested
source ./run-format.zsh

# Function to test the run_format function
test_run_format() {
    local test_name=$1
    shift
    local expected_output=$1
    shift

    echo "Running test: $test_name"
    output=$(run_format "$@" 2>&1)
    if [[ "$output" == *"$expected_output"* ]]; then
        echo "Test passed"
    else
        echo "Test failed"
        echo "Expected: $expected_output"
        echo "Got: $output"
    fi
}

# Test cases
test_run_format "Test help option" "Usage:" --help
test_run_format "Test version option" "Print script version information" --version
test_run_format "Test invalid formatter" "Invalid formatter specified" --formatter invalid

# Add more test cases as needed

echo "All tests completed"