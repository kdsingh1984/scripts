#!/usr/bin/ruby -w

class Box
    ## Class variables starts with @@
    @@count = 0
    def initialize(w,h)
        ##Instant variables
        @width, @height = w, h
        @@count += 1
    end
    def printwidth
        @width
    end
    def printheight
        @height
    end
   
    ##Define value from outside
    def setwidth=(value)
        @width = value
    end
    def setheight=(value)
        @height = value
    end
    def self.printcount()
        print "Total boxes are : #@@count"
    end
   
end

nobj1=Box.new(10,20)

a = nobj1.printwidth
b = nobj1.printheight

puts "Box has width : #{a}"
puts "Box had height : #{b}"

puts "Now check this...................."

nobj1.setwidth=30
nobj1.setheight=50
a = nobj1.printwidth
b = nobj1.printheight

puts "Box has width : #{a}"
print "Box had height : #{b} \n"

Box.printcount