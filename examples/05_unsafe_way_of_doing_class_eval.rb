#!/usr/bin/env ruby -Ku

#
# Example #5:
#
# class_eval (which in this example is used by .property method) forcefully
# replaces method implementation, so there is no super to call
#
# so super(value).gsub(/,/, "") won't work
#
# see next example to find out how to do safe class_eval-ing

require "rubygems"
require "dm-core"

DataMapper.setup(:default, "sqlite3::memory:")

class Article

  #
  # Behaviors
  #

  include DataMapper::Resource

  #
  # Properties
  #

  property :title, String, :key => true

  #
  # API
  #

  def title=(value)
    # v = super(value).gsub(/,/, "")
    # super wouldn't work because .property uses class_eval
    # and it forcefully replaces #title implementation
    v = value.gsub(/,/, "")

    attribute_set(:title, v)
  end # title=(value)

  #
  # Implementation
  #

  protected

  # ...
end

DataMapper.auto_migrate!

article = Article.new
article.title = "There are , some extra commas ,, in this line"
puts article.title
