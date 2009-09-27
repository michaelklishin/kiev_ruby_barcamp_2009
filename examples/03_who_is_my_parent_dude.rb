#!/usr/bin/env ruby -Ku

#
# Example #3:
#
# Classes are just regular objects. You can push Ruby's dynamism to the extreme.
# Try running this script 5 times and see what happens.

require "rubygems"
require "activesupport"

class Joe
end

class Adam
end

class Thomas
end


class WhoIsMyParentDude < [Joe, Adam, Thomas].rand
end # WhoIsMyParentDude

puts WhoIsMyParentDude.superclass.name
