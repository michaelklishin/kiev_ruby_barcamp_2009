#!/usr/bin/env ruby -Ku

#
# Example #4:
#
# Beware of Module.included being called multiple times when classes in large
# application load via ActiveSupport's or Merb's classloaders.
#
# Imagine you have a.rb with reference to B, and b.rb with reference to A.
# No matter what order you are going to load them, first time it will fail.
# Class loaders handle LoadErrors for you and re-try. So, class body may
# execute more than once, and so is Module.included.
#
# So if you do any kind of work that only must be done once (adding classes to
# descendants list, for instance), remember about this possibility.
#

require "rubygems"
require "extlib"
require "set"

module MostAwesomeExtensionEva
  def self.included(host)
    # host.extend(ClassMethods)
  end
end # MostAwesomeExtensionEva

class Entity

  #
  # Behaviors
  #

  # will cause MostAwesomeExtensionEva.included to be called
  # twice
  include MostAwesomeExtensionEva
  include MostAwesomeExtensionEva
end # Entity
