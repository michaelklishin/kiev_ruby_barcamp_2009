#!/usr/bin/env ruby -Ku

#
# Example #1:
#
# We include two modules in a class, and override #valid? method twice
# from modules. APIToken module calls EarlyAccessFlag#valid? method via
# super.
#
# Class uses super to call module's version of the method. No need for
# alias_method_chain. This feature of Ruby is built-in to solve exactly
# this problem: "How do I extend/change behavior of existing method?"
#
# People who invented alias_method_chain simply did not know about this
# feature back in a day. Rails 3 codebase is alias_method_chain free
# these days. Modules + super took over, and rightfully so.

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
