require 'Network'

class AccountUtils

  def self.getContacts()
    Network.request(:get, Network.URL_CONTACTS).execute
  end

  def self.getAccount()

  end

  def self.getDevices()

  end
end