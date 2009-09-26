#!/usr/bin/env ruby -Ku

module WriteThroughCache
  module ClassMethods
    def find(*args)
      if cache_store.fetch(expand_cache_key(*args))
        # return cached object
      else
        # call ORM's finder
        super(*args)
      end
    end
  end

  module InstanceMethods
    
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end

class Person

  #
  # Behaviors
  #

  include WriteThroughCache

end # Person

# Then just use Person.find, and it works
# transparently for every class you include WriteThroughCache into