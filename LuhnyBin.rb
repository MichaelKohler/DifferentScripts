#!/usr/bin/ruby

class LuhnyBinChecker
  def initialize(number)
    @number = number
  end

  def check
    arr = digits(@number)
    puts "Checker: doubling every second number from the right.."
    arr = doubleSecond(arr)
    puts "Calculating the sum and validating the result."
    getResult(sumNumbers(arr))
  end

  def digits(n)
    n.scan(/\d/).map{ |c| c.to_i }
  end

  def doubleSecond
    arr.each_with_index do |item, i|
      arr[i] = arr[i] * 2 if (i %2 == 0)
    end
  end

  # treat numbers >= 10 individually 
  # e.g. 12 -> 1 + 2 = 3
  def sumNumbers(arr)
    arr.map{|i|
        i > 9 ? splittedSum(i) : i
    }.inject(0,:+)
  end

  def splittedSum(number)
    digits(number).inject(0,:+)
  end

  def getResult(sum)
    sum.modulo(10) == 0
  end
end

class CreditCard
  attr_reader :number
  def setCardNumber(number)
    @cardNumber = number
  end

  def verify
    (LuhnyBinChecker.new(@number)).check
  end
end

if __FILE__ == $0
  puts "Please enter the credit card number to check:"
  input = gets()				# input card number
  abort "Please enter only numbers." if input !~/(\d+\s)+/

  card = CreditCard.new(input)
  puts "You entered: " + card.number

  puts "Verifying card number now..."
   if card.verify()
     puts "Credit card number is valid"
  else
     puts "Credit card number is valid"
  end

end
