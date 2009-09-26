#!/usr/bin/env ruby -Ku

module MostAwesomeExtensionEva
  def self.included(receiver)
    metaprogramming_goodness = Module.new

    # receiver.class_eval do
    metaprogramming_goodness.class_eval do
      def an_added_method
        puts "Well, my origin is module!"
      end
    end

    receiver.__send__(:include, metaprogramming_goodness)
  end
end

class Entity
  
  #
  # Behaviors
  #

  include MostAwesomeExtensionEva

end # Entity

entity = Entity.new
entity.an_added_method

puts Entity.instance_method(:an_added_method).inspect