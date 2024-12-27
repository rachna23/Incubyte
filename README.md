# Incubyte
String Calculator

**Overview**

The String Calculator is a Ruby class that calculates the sum of numbers provided as input strings. It supports custom delimiters, handles negative numbers by raising errors, and processes multiple numbers separated by commas, newlines, or custom delimiters.

Features

**Default Delimiters:** Supports commas (,) and newlines (\n) as default delimiters.

**Custom Delimiters:** Allows specifying custom delimiters by prefixing the input with //.

**Multiple Delimiters:** Accepts multiple custom delimiters enclosed in square brackets.

Negative Numbers Handling: Raises an exception if negative numbers are provided.

Usage

**Example 1:** Default Delimiters

calculator = StringCalculator.new
puts calculator.add("1,2,3") # Output: 6
puts calculator.add("1\n2,3") # Output: 6

**Example 2:** Custom Delimiter

puts calculator.add("//;\n1;2;3") # Output: 6

**Example 3:** Multiple Delimiters

puts calculator.add("//[;][|]\n1;2|3") # Output: 6

**Example 4:** Negative Numbers

puts calculator.add("1,2,-3") # Raises an error: Negative numbers not allowed: -3

Test Cases

RSpec tests are provided to validate the functionality of the String Calculator.

Running Tests

rspec string_calculator_spec.rb

Sample Tests

it 'returns the sum of numbers separated by commas' do
  expect(calculator.add("1,2,3")).to eq(6)
end

it 'raises an error for negative numbers' do
  expect { calculator.add("-1,2,-3") }.to raise_error("Negative numbers not allowed: -1, -3")
end

Requirements

Ruby Version: 2.7 or higher

RSpec: For testing

**Installation**

**Clone this repository:**

[git clone <repository-url>](https://github.com/rachna23/Incubyte)

Install dependencies:

bundle install

Run the test suite:

rspec

**Limitations**

The current implementation does not support ignoring numbers larger than 1000.

Multiple delimiters must be enclosed in square brackets.


Author

[Rachana Mishra]
