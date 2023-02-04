# string_concat
describe "string_concat.rb" do
  it "should output 'Ruby's fun' using concat", points: 1 do
    concat_file = "string_concat.rb"
    file_contents = File.read(concat_file)
    
    File.foreach(concat_file).with_index do |line, line_num|
      if line.match(/^p.*"Ruby's fun"/) || line.include?("puts")
        expect(line).to_not match(/Ruby's fun/),
          "Expected 'string_concat.rb' to NOT just pring the String literal 'Ruby's fun', but did."
      end
    end

    concat_counter = 0
    File.foreach(concat_file).with_index do |line, line_num|
      if line.include?(".concat(") 
        unless line.include?("#")
          concat_counter += 1
        end
      end
    end
    expect(concat_counter).to be > 0,
      "Expected 'string_concat.rb' to use the .concat method, but it did not."

    output = with_captured_stdout { require_relative('../../string_concat')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Ruby's fun/)).to be(true), "Expected output to be 'Ruby's fun', but was #{output}"
  end
end


# string_addition
describe "string_addition.rb" do
  it "should output 'Add it together' using String addition", points: 1 do
    addition_file = "string_addition.rb"
    file_contents = File.read(addition_file)
    
    File.foreach(addition_file).with_index do |line, line_num|
      if line.match(/^p.*"Add it together"/) || line.include?("puts")
        expect(line).to_not match(/Add it together/),
          "Expected 'string_addition.rb' to NOT print the String literal 'Add it together', but did."
      end
    end
    
    assignment_counter = 0
    File.foreach(addition_file).with_index do |line, line_num|
      if line.include?("=") 
        unless line.include?("#")
          assignment_counter += 1
        end
      end
    end
    expect(assignment_counter).to be >= 2,
      "Expected 'string_addition.rb' to use at least two variables to store parts of the string before adding, but only #{assignment_counter} '=' found."
    
    plus_counter = 0
    File.foreach(addition_file).with_index do |line, line_num|
      if line.include?("+") 
        unless line.include?("#")
          plus_counter += 1
        end
      end
    end
    expect(plus_counter).to be >= 1,
      "Expected 'string_addition.rb' to use the + plus method, but only #{plus_counter} '+' found."
    
    output = with_captured_stdout { require_relative('../../string_addition')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Add it together/)).to be(true), "Expected output to be 'Add it together', but was #{output}"
  end
end


# string_multiplication
describe "string_multiplication.rb" do
  it "should output 'HoHoHo' using String multiplication", points: 1 do
    multiplication_file = "string_multiplication.rb"
    file_contents = File.read(multiplication_file)

    File.foreach(multiplication_file).with_index do |line, line_num|
      if line.match(/^p.*"HoHoHo"/) || line.include?("puts")
        expect(line).to_not match(/HoHoHo/),
          "Expected 'string_multiplication.rb' to NOT print the String literal 'HoHoHo', but did."
      end
    end

    multiplication_counter = 0
    File.foreach(multiplication_file).with_index do |line, line_num|
      if line.include?("*") 
        unless line.include?("#")
          multiplication_counter += 1
        end
      end
    end
    expect(multiplication_counter).to be >= 1,
      "Expected 'string_addition.rb' to use the * multiplication method, but only #{multiplication_counter} '*' found."

    output = with_captured_stdout { require_relative('../../string_multiplication')} 
    output = "empty" if output.empty? 
    expect(output.match?(/HoHoHo/)).to be(true), "Expected output to be 'HoHoHo', but was #{output}"
  end
end


# string_case
describe "string_case.rb" do
  it "should output 'HELLO friends AnD FaMiLy'", points: 1 do
    case_file = "string_case.rb"
    file_contents = File.read(case_file)

    File.foreach(case_file).with_index do |line, line_num|
      if line.match(/^p.*"HELLO friends AnD FaMiLy"/) || line.include?("puts")
        expect(line).to_not match(/HELLO friends AnD FaMiLy/),
          "Expected 'string_case.rb' to NOT print the String literal 'HELLO friends AnD FaMiLy', but did."
      end
    end

    output = with_captured_stdout { require_relative('../../string_case')} 
    output = "empty" if output.empty? 
    expect(output.match?(/HELLO friends AnD FaMiLy/)).to be(true), "Expected output to be 'HELLO friends AnD FaMiLy', but was #{output}."
  end
end


# string_strip
describe "string_strip.rb" do
  it "should output 'remove outside spaces'", points: 1 do
    output = with_captured_stdout { require_relative('../../string_strip')} 
    output = "empty" if output.empty? 
    expect(output.length).to be <= 28, "Expected output to be 'remove the outside spaces', but output was #{output.length} characters long."
    expect(output.match?(/remove the outside spaces/)).to be(true), "Expected output to be 'remove the outside spaces', but was #{output}"
  end
end


# string_gsub
describe "string_gsub.rb" do
  it "should output 'put spaces in between these words'", points: 1 do
    output = with_captured_stdout { require_relative('../../string_gsub')} 
    output = "empty" if output.empty? 
    expect(output.match?(/put spaces in between these words/)).to be(true), "Expected output to be 'put spaces in between these words', but was #{output}."
  end
end


# string_chomp
describe "string_chomp.rb" do
  it "should remove ending '$'", points: 1 do
    output = with_captured_stdout { require_relative('../../string_chomp')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Hello!/)).to be(true), "Expected output to be 'Hello!', but was #{output}."
  end
end


# string_gets
describe "string_gets.rb" do
  it "should output 'Hello, name!'" , points: 1 do
    allow_any_instance_of(Object).to receive(:gets).and_return("jelani\n")

    output = with_captured_stdout { require_relative('../../string_gets')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Hello, Jelani!/)).to be(true), "Expected output to be 'Hello, Jelani!', but was #{output}."
  end
end


def with_captured_stdout
  original_stdout = $stdout  # capture previous value of $stdout
  $stdout = StringIO.new     # assign a string buffer to $stdout
  yield                      # perform the body of the user code
  $stdout.string             # return the contents of the string buffer
ensure
  $stdout = original_stdout  # restore $stdout to its previous value
end
