#!/usr/bin/env ruby -Ku

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

  include MostAwesomeExtensionEva
  include MostAwesomeExtensionEva
end # Entity
