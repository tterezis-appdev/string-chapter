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
    output = with_captured_stdout { require_relative('../../string_multiplication')} 
    output = "empty" if output.empty? 
    expect(output.match?(/HoHoHo/)).to be(true), "Expected output to be 'HoHoHo', but was #{output}"
  end
end

describe "string_strip.rb" do
  it "should output 'remove outside spaces'", points: 1 do

    output = with_captured_stdout { require_relative('../../string_strip')} 
    output = "empty" if output.empty? 

    expect(output.length).to be <= 28, "Expected output to be 'remove the outside spaces', but output was #{output.length} characters long."
    expect(output.match?(/remove the outside spaces/)).to be(true), "Expected output to be 'remove the outside spaces', but was #{output}"
  end
end

describe "string_case.rb" do
  it "should output 'HELLO friends AnD FaMiLy'", points: 1 do
    output = with_captured_stdout { require_relative('../../string_case')} 
    output = "empty" if output.empty? 
    expect(output.match?(/HELLO friends AnD FaMiLy/)).to be(true), "Expected output to be 'HELLO friends AnD FaMiLy', but was #{output}."
  end
end

describe "string_gsub.rb" do
  it "should output 'put spaces in between these words'", points: 1 do
    output = with_captured_stdout { require_relative('../../string_gsub')} 
    output = "empty" if output.empty? 
    expect(output.match?(/put spaces in between these words/)).to be(true), "Expected output to be 'put spaces in between these words', but was #{output}."
  end
end

describe "string_chomp.rb" do
  it "should remove ending '$'", points: 1 do
    output = with_captured_stdout { require_relative('../../string_chomp')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Hello!/)).to be(true), "Expected output to be 'Hello!', but was #{output}."
  end
end

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
