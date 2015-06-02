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


end