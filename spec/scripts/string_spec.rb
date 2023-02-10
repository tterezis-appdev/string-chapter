# concat
describe "concat.rb" do
  it "should output 'Ruby's fun' using concat", points: 1 do
    concat_file = "concat.rb"
    file_contents = File.read(concat_file)
    
    File.foreach(concat_file).with_index do |line, line_num|
      if line.match(/^p.*"Ruby's fun"/) || line.include?("puts")
        expect(line).to_not match(/Ruby's fun/),
          "Expected 'concat.rb' to NOT just pring the String literal 'Ruby's fun', but did."
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
      "Expected 'concat.rb' to use the .concat method, but it did not."

    output = with_captured_stdout { require_relative('../../concat')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Ruby's fun/)).to be(true), "Expected output to be 'Ruby's fun', but was #{output}"
  end
end


# addition
describe "addition.rb" do
  it "should output 'Add it together' using String addition", points: 1 do
    addition_file = "addition.rb"
    file_contents = File.read(addition_file)
    
    File.foreach(addition_file).with_index do |line, line_num|
      if line.match(/^p.*"Add it together"/) || line.include?("puts")
        expect(line).to_not match(/Add it together/),
          "Expected 'addition.rb' to NOT print the String literal 'Add it together', but did."
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
      "Expected 'addition.rb' to use at least two variables to store parts of the string before adding, but #{assignment_counter} '=' found."
    
    plus_counter = 0
    File.foreach(addition_file).with_index do |line, line_num|
      if line.include?("+") 
        unless line.include?("#")
          plus_counter += 1
        end
      end
    end
    expect(plus_counter).to be >= 1,
      "Expected 'addition.rb' to use the + plus method, but #{plus_counter} '+' found."
    
    output = with_captured_stdout { require_relative('../../addition')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Add it together/)).to be(true), "Expected output to be 'Add it together', but was #{output}"
  end
end


# multiplication
describe "multiplication.rb" do
  it "should output 'HoHoHo' using String multiplication", points: 1 do
    multiplication_file = "multiplication.rb"
    file_contents = File.read(multiplication_file)

    File.foreach(multiplication_file).with_index do |line, line_num|
      if line.match(/^p.*"HoHoHo"/) || line.include?("puts")
        expect(line).to_not match(/HoHoHo/),
          "Expected 'multiplication.rb' to NOT print the String literal 'HoHoHo', but did."
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
      "Expected 'addition.rb' to use the * multiplication method, but #{multiplication_counter} '*' found."

    output = with_captured_stdout { require_relative('../../multiplication')} 
    output = "empty" if output.empty? 
    expect(output.match?(/HoHoHo/)).to be(true), "Expected output to be 'HoHoHo', but was #{output}"
  end
end


# case
describe "case.rb" do
  it "should output 'HELLO friends AnD FaMiLy'", points: 1 do
    case_file = "case.rb"
    file_contents = File.read(case_file)

    File.foreach(case_file).with_index do |line, line_num|
      if line.match(/^p.*"HELLO friends AnD FaMiLy"/) || line.include?("puts")
        expect(line).to_not match(/HELLO friends AnD FaMiLy/),
          "Expected 'case.rb' to NOT print the String literal 'HELLO friends AnD FaMiLy', but did."
      end
    end

    output = with_captured_stdout { require_relative('../../case')} 
    output = "empty" if output.empty? 
    expect(output.match?(/HELLO friends AnD FaMiLy/)).to be(true), "Expected output to be 'HELLO friends AnD FaMiLy', but was #{output}."
  end
end


# chomp
describe "chomp.rb" do
  it "should remove ending '$'", points: 1 do
    chomp_file = "chomp.rb"
    file_contents = File.read(chomp_file)

    File.foreach(chomp_file).with_index do |line, line_num|
      if line.match(/^p.*"Hello!"/) || line.include?("puts")
        expect(line).to_not match(/Hello!/),
          "Expected 'chomp.rb' to NOT print the String literal 'Hello!', but did."
      end
    end

    output = with_captured_stdout { require_relative('../../chomp')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Hello!/)).to be(true), "Expected output to be 'Hello!', but was #{output}."
  end
end


# gsub
describe "gsub.rb" do
  it "should output 'put spaces in between these words'", points: 1 do
    gsub_file = "gsub.rb"
    file_contents = File.read(gsub_file)

    File.foreach(gsub_file).with_index do |line, line_num|
      if line.match(/^p.*"put spaces in between these words"/) || line.include?("puts")
        expect(line).to_not match(/put spaces in between these words/),
          "Expected 'gsub.rb' to NOT print the String literal 'put spaces in between these words', but did."
      end
    end

    output = with_captured_stdout { require_relative('../../gsub')} 
    output = "empty" if output.empty? 
    expect(output.match?(/put spaces in between these words/)).to be(true), "Expected output to be 'put spaces in between these words', but was #{output}."
  end
end


# strip
describe "strip.rb" do
  it "should output 'Remove outside spaces and capitalize'", points: 1 do
    strip_file = "strip.rb"
    file_contents = File.read(strip_file)

    strip_counter = 0
    File.foreach(strip_file).with_index do |line, line_num|
      if line.include?(".strip") 
        unless line.include?("#")
          strip_counter += 1
        end
      end
    end
    expect(strip_counter).to be >= 1,
      "Expected 'strip.rb' to use the strip method, but .strip not found in code."

    capitalize_counter = 0
    File.foreach(strip_file).with_index do |line, line_num|
      if line.include?(".capitalize") 
        unless line.include?("#")
          capitalize_counter += 1
        end
      end
    end
    expect(capitalize_counter).to be >= 1,
      "Expected 'strip.rb' to use the capitalize method, but .capitalize not found in code."


    File.foreach(strip_file).with_index do |line, line_num|
      if line.match(/^p.*"Remove outside spaces and capitalize"/) || line.include?("puts")
        expect(line).to_not match(/Remove outside spaces and capitalize/),
          "Expected 'strip.rb' to NOT print the String literal 'Remove outside spaces and capitalize', but did."
      end
    end

    output = with_captured_stdout { require_relative('../../strip')} 
    output = "empty" if output.empty? 
    expect(output.length).to be <= 39, "Expected output to be 'Remove outside spaces and capitalize', but output was #{output.length} characters long."
    expect(output.match?(/Remove outside spaces and capitalize/)).to be(true), "Expected output to be 'Remove outside spaces and capitalize', but was #{output}"
  end
end


# gets
describe "gets.rb" do
  it "should output 'Hello, name!'" , points: 1 do
    allow_any_instance_of(Object).to receive(:gets).and_return("jelani\n")

    output = with_captured_stdout { require_relative('../../gets')} 
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
