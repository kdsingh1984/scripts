#!/usr/bin/ruby -w
#Just for fun testing everything mentioned in
#http://www.tutorialspoint.com/ruby/ruby_syntax.htm

END {
    puts "No more work"
    }
puts "Hello All"
BEGIN {
    puts "This is first test script"
    }

class Sample
    #This is Sample Class
    def hello(id, name, address)
        puts "Hello #{name} your ID is #{id}"
    end
end

obj1 = Sample. new
obj1.hello(1,'kamal','New Delhi')

$totalnumber=10
class Testglobalvar
    # this class is for testing global variables
    def print_number
        puts "There are #$totalnumber apples in bucket"
    end
end

Testobj1 = Testglobalvar.new
Testobj1.print_number

#Below example is for Instance Variable
#Instance variable starts with @
#
class Instancevar
    def initialize(name, number, email)
        @cust_name=name
        @cust_number=number
        @cust_email=email
    end
    def print_details()
        puts "Customer name is #@cust_name"
        puts "Customer numebr is #@cust_number"
    end
end
custobj1=Instancevar.new('Kamal','1234','hdjf@djbf')
custobj1.print_details()