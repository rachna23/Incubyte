class StringCalculator
  def add(numbers)
    # Check if the input has a custom delimiter (starts with //)
    if numbers.start_with?("//")
      # Extract the delimiter and the numbers string
      delimiter, numbers = extract_delimiter_and_numbers(numbers)
    else
      # Default delimiter is comma
      delimiter = ","
    end

    # Split the numbers using the delimiter(s) and calculate the sum
    numbers = numbers.split(/[#{Regexp.escape(delimiter)}\n]/)

    # Check for negative numbers
    negative_numbers = numbers.select { |num| num.to_i < 0 }
    raise "Negative numbers not allowed: #{negative_numbers.join(', ')}" if negative_numbers.any?

    # Return the sum of numbers
    numbers.map(&:to_i).sum
  end

  private

  # Method to extract the delimiter and the numbers part from the string
  def extract_delimiter_and_numbers(numbers)
    delimiter = numbers[2..numbers.index("\n") - 1]  # Extract delimiter
    numbers = numbers[numbers.index("\n") + 1..]  # Get the actual numbers part
    [delimiter, numbers]
  end
end

require 'rspec'

RSpec.describe StringCalculator do 
  ss = StringCalculator.new

  it 'should give sum of provided number' do 
    sum = ss.add("1,4")
    expect(sum).to eq(5)
  end

  it 'returns the sum of many numbers' do
    sum = ss.add("1,2,3,4,5")
    expect(sum).to eq(15)
  end

  it 'should handle custom delimiter' do
    sum = ss.add("//;\n1;2")
    expect(sum).to eq(3)
  end

  it 'should handle custom delimiter with many numbers' do
    sum = ss.add("//;\n1;2;3;4;5")
    expect(sum).to eq(15)
  end

  # Test case with multiple delimiters
  it 'should handle multiple delimiters' do
    sum = ss.add("//[;][|]\n1;2|3")
    expect(sum).to eq(6)
  end

  # Test case where negative numbers are provided
  it 'raises an error when negative numbers are provided' do
    expect { ss.add("1,2,-3,4,-5") }.to raise_error("Negative numbers not allowed: -3, -5")
  end

  # Test case where only a single negative number is provided
  it 'raises an error when a single negative number is provided' do
    expect { ss.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
  end
end
