#!/usr/bin/ruby

class LuhnyBinChecker
  def initialize(number)
    @number = number
  end

  def check
    createNumberArray
    doubleSecond
    sumNumbers
    getResult
  end

  def createNumberArray
    @numberArray = @number.scan(/\d/).map { |c| c.to_i }
  end

  def doubleSecond
    puts "Checker: doubling every second number from the right.."
    i = @numberArray.length - 1 
    pos = 0
    while i >= 0
      if pos.modulo(2) == 1
        @numberArray[i] = @numberArray[i] * 2
      end
      i = i - 1
      pos = pos + 1
    end
  end

  def sumNumbers
    puts "Checker: calculating the sum.."
    @sum = 0
    @numberArray.each do |i|
      if i > 9
        @sum = @sum + splittedSum(i) # treat numbers >= 10 individually
                                     # e.g. 12 -> 1 + 2 = 3
      else
        @sum = @sum + i
      end
    end
  end

  def splittedSum(number)
    numberAsString = number.to_s()
    splittedNumbers = numberAsString.scan(/\d/).map { |c| c.to_i }
    splittedSum = 0
    splittedNumbers.each do |n|
      splittedSum = splittedSum + n
    end
    return splittedSum
  end

  def getResult
    if @sum.modulo(10) == 0
      puts "Credit card number is valid"
    else
      puts "Credit card number is not valid"
    end
  end
end

class CreditCard
  def setCardNumber(number)
    @cardNumber = number
  end

  def getCardNumber
    if @cardNumber!= nil
      @cardNumber
    end
  end

  def verify
    puts "Verifying card number now..."
    checker = LuhnyBinChecker.new(@cardNumber)
    checker.check
  end
end

if __FILE__ == $0
  card = CreditCard.new

  puts "Please enter the credit card number to check:"
  gets				# input card number
  input = $_
  if input.match(/[a-z]/i) != nil || input.match(/\d/) == nil
    puts "Please enter only numbers."
    exit
  end

  card.setCardNumber(input)
  puts "You entered: " + card.getCardNumber
  card.verify
end
