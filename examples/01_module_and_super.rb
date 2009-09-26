#!/usr/bin/env ruby -Ku

module EarlyAccessFlag
  def valid?
    self.early_access = false
  end # valid?
end # EarlyAccessFlag


module APIToken
  def valid?
    self.api_token = self.class.generate_api_token

    super
    true
  end # valid?
end # APIToken


class Account

  #
  # Behaviors
  #

  include EarlyAccessFlag
  include APIToken

  #
  # Attributes
  #

  attr_accessor :api_token, :early_access

  #
  # API
  #

  def self.generate_api_token
    "t0p_sekr3t"
  end # self.generate_api_token

  def valid?
    super

    puts "My API token is #{self.api_token}"
    puts "My early access flag is set to #{self.early_access}"
    true
  end # valid?
end # Account


account = Account.new
account.valid?
