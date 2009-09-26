#!/usr/bin/env ruby -Ku

module APIToken
  def valid?
    self.api_token = self.class.generate_api_token
  end # valid?
end # APIToken


class Account

  #
  # Behaviors
  #

  # ...

  #
  # Attributes
  #

  attr_accessor :api_token

  #
  # API
  #

  def self.generate_api_token
    "t0p_sekr3t"
  end # self.generate_api_token

  def valid?
    super if defined? super

    puts "My API token is #{self.api_token}"
    true
  end # valid?
end # Account


account = Account.new
account.valid?
