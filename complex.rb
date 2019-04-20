class ComplexNumber
    @@countAdd = 0
    @@countMul = 0

    attr_accessor :real , :imag , :countAdd , :countMul

    def initialize(real , imag)
        @real= real
        @imag= imag
    end

    def +(cn1)
        self.countAdd=@@countAdd +=1
        ComplexNumber.new(@real + cn1.real, @imag + cn1.imag)
    end

    def *(cn2)
        realpart=(@real * cn2.real - @imag * cn2.imag)
        imagpart=(@real * cn2.imag + @imag * cn2.real)
        self.countMul=@@countMul +=1
        ComplexNumber.new(realpart,imagpart)
    end


    def self.bulk_add​ (array) 
        cn=ComplexNumber.new(0,0)
        array.each do |complexNum|
            cn = cn + complexNum
        end
        return cn
    end
 
    def self.bulk_multiply (array) 
       cn=ComplexNumber.new(1,1)
       array.each do |complexNum|
            cn = cn * complexNum
       end
       return cn
    end

    def self.get_stats()
        {
            :numOfAdd => @@countMul,
            :numOfMul => @@countMul
        }
    end    

    def to_s
        return "(#{@real} + #{@imag}i)"
    end
   
end  
 

num1=ComplexNumber.new(1,5)
num2=ComplexNumber.new(2,5)
num3=ComplexNumber.new(3,2)
num4=ComplexNumber.new(9,6)


num1+num2
num1+num2
num1*num2
num1*num2

puts "\nAdding:"
puts "num1 + num2: #{(num1 + num2).inspect}"


puts "\nmultiply:"
puts "num1 * num2: #{(num1 * num2).inspect}"


puts ComplexNumber.bulk_add​([num1,num2,num3,num4])
puts ComplexNumber.bulk_multiply([num1,num2])

puts ComplexNumber.get_stats()

