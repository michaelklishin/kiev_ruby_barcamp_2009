class Person

  #
  # Behaviors/Protocols
  #

  # ..

  #
  # Attributes/Properties
  #

  attr_accessor :api_token

  #
  # API
  #

  def self.generate_api_token
    "t0p_s3kret"
  end # self.generate_api_token

  def valid?
    # should actually be self.api_token = self.class.generate_api_token:
    # otherwise, api_token becomes a local variable    
    api_token = self.class.generate_api_token
    self.api_token
  end # valid?

  #
  # Implementation
  #

  protected

  # ...
end # Person


michael = Person.new
michael.valid? # of course he is
puts michael.api_token
