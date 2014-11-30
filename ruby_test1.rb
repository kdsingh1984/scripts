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

#if loop example:
x=1
if x > 2
   puts "x is greater than 2"
elsif x <= 2 and x!=0
   puts "x is 1"
else
   puts "I can't guess the number"
end

$debug=1
print "debug\n" if $debug

unless x > 2
    print "x is less then 2\n"
else
    print "x is grt then 2\n"
end
$kamal=nil
print "value is less\n" unless $kamal

#Ruby Case statement
#case experssion is compared with when expression and code separated from when expression using then,newline or semi-colon
$age=6
case $age
when 0..2 then print "This is Baby age\n"
when 2..5 then print "This is Little Child\n"
else print "These are kids\n"
end

    #While statement
    # While separated from code using do, newline or Semicolon
$i=0
$num=5
    while $i < $num
        puts "Number in loop is #$i"
        $i += 1
    end
    
$start=0
$end=5
until $start > $end
    puts "Start is still #$start"
    $start += 1
end
#break: it will terminate a method with an associated block.
#next: jump to next iteration of most recent loop.
for i in 0..5
    if i > 2
        break
    end
    puts "Value of i is #{i}, which is less then 3"
end
for i in 0..5
    if i <= 2
        next
    end
    puts "Value of i is #{i}, which is greater then 2"
end

#Ruby Method
#Reuby methods are just like functions in any other language
def first_method(a1,a2)
    puts "Value of arguments are #{a1} and #{a2}"
end
first_method 1,2

#Ruby allows to declare * number of arguments, Here is Example
def variable_test(*test)
    puts "Total defined variables are #{test.length}"
    for i in 0...test.length
        puts "Value of variable is #{test[i]}"
    end
end

variable_test 'kamal','jass','seerat'

#Ruby class, object, alias, undef
#alias: it give alias to method or global variable. it keeps current defination even if method is modified.
#undef: it cancel the method defination.
#
#Ruby Modules
#Modules is a way to group together classes,methods,constants without any issue of name clashes
#Modules name start with upper case letter. define method start with module name with . and methoud name
module Testmodule
    VAR1=1
    def Testmodule.method1(a1,a2)
        puts "I am method from module Testmodule with arguments #{a1} and #{a2}"
    end
end

Testmodule.method1('kamal','jass')
puts "constant in Testmodule is #{Testmodule::VAR1}"

#require: it is same like include in python
#
