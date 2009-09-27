#!/usr/bin/env ruby -Ku

#
# Example #1 for class object methods (some would call them "class methods").
# super call from module methods works exactly the same.
#
# In this example, we override .find to change it's behavior a tad: it first goes
# to Memcached to fetch results. Original behavior (load from the database)
# is used as a fallback.
#
# This module can be included into any class that needs this behavior. Nice, eaasy
# and transparent.
#
# And, exception traces will be readable.

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
