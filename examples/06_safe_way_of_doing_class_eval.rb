#!/usr/bin/env ruby -Ku

#
# Example #6: safe class_eval-ing is done by creating a module,
# class_eval-ing on it, and including it into a class we want to extend.
#
# It preserves ability for methods to call super, because module inclusion
# results in an anonymous class in inheritance chain.

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
