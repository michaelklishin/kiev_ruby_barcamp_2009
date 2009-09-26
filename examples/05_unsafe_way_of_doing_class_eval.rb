#!/usr/bin/env ruby -Ku

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
