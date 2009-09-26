#!/usr/bin/env ruby -Ku

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
