#!/usr/bin/ruby -w
#Just for fun testing everything mentioned in
#http://www.tutorialspoint.com/ruby/ruby_syntax.htm

END {
    puts "\b\n============ No more work==========="
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

#Below Example is for Class variable
#Class variable start with @@
##
class Testclassvar
    @@numberofcust=0
    def initialize(name,number,address)
        @cust_name=name
        @cust_number=number
        @cust_address=address
    end
    def total_no_customer()
        @@numberofcust +=1
        puts "Total number of customer #@@numberofcust"
    end
end
cust1=Testclassvar.new('kamal','123243','dfdf@dfdf')
cust2=Testclassvar.new('jass','123243','dfdf@dfdf')

cust1.total_no_customer()
cust2.total_no_customer()
#In above example name,number and address were local variables.
#Local variabled are either begin with lowercase or _
#
#Below defines Ruby constants. They are in caps
#
class Testconstant
    VAR1='kamal'
    VAR2='jass'
    def family
        puts "King is #{VAR1}"
        puts "Queen is #{VAR2}"
    end
end

constantobj1=Testconstant.new
constantobj1.family()
       
#You cannot assign any value to these variables
#self: Receiver object for current method
#true: value representing true
#false: value repersenting false
#nil: value representing undefined
#__FILE__: The name of the current source file
#__LINE__: The current line number in the source file
#
#For array loop test
testarray = [ 'usr1', 'usr2' ]
testarray.each do |i|
    puts "here is #{i}"
end

#Ruby hash loop test
testhash={ 'kamal'=> 30, 'jass'=> 27, 'seeart'=> 1 }
testhash.each do |key, value|
    print key," age is ", value, "\n"
end

#Ruby Range
(10..15).each do |i|
    print i,"\n"
end

#Ruby Range creater
# .. -> create range with start and end number, 1..10 is range from 1 to 10
# ... -> create range excluding ending number, 1...10 is range from 1 to 9
# 
# Ruby defined operator
# It is used to check if variable, method etc exists. it return nil incase it wont exists.
# 
# Ruby dot '.' and double colon '::' Operators
# dot '.' is used for calling method of module
# double colons '::' is used for calling constant from class 
# 
puts Testconstant::VAR1