require_relative 'Network'

class AccountUtils

  def self.get_contacts
    response = Network.request(:get, Network.URL_CONTACTS).execute

    print response
  end

  def self.get_account

  end

  def self.get_devices

  end
end