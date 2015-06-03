require "calculator.rb"

describe Calculator do

  describe "#add" do
    let(:calc) { Calculator.new }

    it "raises error if fewer than 2 inputs" do
      expect { calc.add(1) }.to raise_error(ArgumentError)
    end

    it "raises error if more than 2 inputs" do
      expect { calc.add(1, 2, 3) }.to raise_error(ArgumentError)
    end

    it "adds 2 integers together" do
      expect(calc.add(1, 2)).to eq(3)
    end

    it "correctly adds negative numbers" do
      expect(calc.add(1, -3)).to eq(-2)
    end

    it "correctly adds negative floats" do
      expect(calc.add(1.5, 2.3)).to eq(3.8)
    end
  end


  describe "#subtract" do
    let(:calc) { Calculator.new }

    it "subtracts the 2nd input from the 1st" do
      expect(calc.subtract(5, 2)).to eq(3)
    end

    it "correctly subtracts when using negative integers" do
      expect(calc.subtract(5, -2)).to eq(7)
    end

    it "correctly subtracts when using negative floats" do
      expect(calc.subtract(5.4, -2.3)).to eq(7.7)
    end

  end


  describe "#multiply" do
    let(:calc) { Calculator.new }

    it "properly multiplies 2 numbers" do
      expect(calc.multiply(3, 5)).to eq(15)
    end

    it "properly multiplies negative numbers" do
      expect(calc.multiply(3, -4)).to eq(-12)
    end

    it "properly multiplies floats" do
      expect(calc.multiply(2.2, 1.5)).to be_within(0.001).of(3.3)
    end

  end


  describe "#divide" do
    let(:calc) { Calculator.new }

    it "properly divides 1st input by the 2nd" do
      expect(calc.divide(12, 3)).to eq(4)
    end

    it "raises an Argument Error if 2nd input is zero" do
      expect { calc.divide(12, 0) }.to raise_error(ArgumentError)
    end

    it "returns an integer if there is no remainder" do
      output = calc.divide(15, 5)
      expect(output).to be_a(Integer)
      expect(output).to eq(3)
    end

    it "returns a float if there is a remainder" do
      output = calc.divide(15, 6)
      expect(output).to be_a(Float)
      expect(output).to be_within(0.001).of(2.5)
    end

  end


  describe "#pow" do
    let(:calc) { Calculator.new }

    it "raises the first number to the power of the second" do
      expect(calc.pow(4, 3)).to eq(64)
    end

    it "applies negative powers as 1 / x^n" do
      expect(calc.pow(3, -2)).to be_within(0.001).of(0.1111)
    end

    it "applies decimal powers by getting the n-th root" do
      expect(calc.pow(9, 0.5)).to eq(3)
      expect(calc.pow(256, 0.25)).to eq(4)
    end

  end


  describe "#sqrt" do
    let(:calc) { Calculator.new }

    it "calculates square roots for positive numbers" do
      expect(calc.sqrt(9)).to eq(3)
    end

    it "raises an error for negative numbers" do
      expect { calc.sqrt(-4) }.to raise_error
    end

    it "returns integers for round number roots" do
      expect(calc.sqrt(16)).to be_a(Integer)
    end

    it "returns 2-decimals for non-round numbers" do
      expect(calc.sqrt(30)).to eq(5.48)
    end

  end


  describe "#memory=" do
    let(:calc) { Calculator.new }

    it "stores an object in memory" do
      calc.memory = 6
      expect(calc.memory).to eq(6)
    end

    #foo.instance_variable_set(:@foo, 12)
    it "overwrites any previous object in memory" do
      calc.instance_variable_set(:@memory, 12)
      calc.memory = 8
      expect(calc.memory).to eq(8)
    end

  end


  describe "#memory" do
    let(:calc) { Calculator.new }

    it "returns the object in memory" do
      calc.instance_variable_set(:@memory, 6)
      expect(calc.memory).to eq(6)
    end

    it "clears memory when returned" do
      calc.instance_variable_set(:@memory, 6)
      calc.memory
      expect(calc.memory).to be_nil
    end

    it "starts as nil" do
      expect(calc.memory).to be_nil
    end

  end


  describe "#stringify" do
    let(:calc) { Calculator.new(:stringify) }

    it "returns #add output as a string" do
      expect(calc.add(3,4)).to be_a(String)
    end

    it "returns #subtract output as a string" do
      expect(calc.subtract(9,4)).to be_a(String)
    end

    it "returns #multiply output as a string" do
      expect(calc.multiply(3,4)).to be_a(String)
    end

    it "returns #divide output as a string" do
      expect(calc.divide(16,4)).to be_a(String)
    end

    it "returns #pow output as a string" do
      expect(calc.pow(3,4)).to be_a(String)
    end

    it "returns #sqrt output as a string" do
      expect(calc.sqrt(25)).to be_a(String)
    end

  end

end