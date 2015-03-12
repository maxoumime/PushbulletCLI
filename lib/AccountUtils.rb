require_relative 'Network'

class AccountUtils

  @@contacts = nil
  @@channels = nil
  @@devices = nil

  def self.get_contacts_dist

    response = Network.request(:get, Network.URL_CONTACTS)

    #puts JSON.generate AccountUtils.channels
    #puts JSON.generate AccountUtils.contacts

    contactsJSON = []
    if response != nil
      contactsJSON = response['contacts']
    end

    contacts = Hash.new
    contactsJSON.each do |c|
      if c.key?('name') and c.key?('email')
        contacts[c['name'].upcase] = c['email']
      end
    end

    return contacts
  end

  def self.get_channels_dist
    response = Network.request(:get, Network.URL_CHANNELS)

    channelsJSON = []
    if response != nil
      channelsJSON = response['subscriptions']
    end

    channels = Hash.new
    channelsJSON.each do |c|
      if c.key?('channel') and c['channel'].key?('name') and c.key?('iden')
        channels[c['channel']['name'].upcase] = c['iden']
      end
    end

    return channels
  end

  def self.get_devices_dist
    response = Network.request(:get, Network.URL_DEVICES)

    devicesJSON = []
    if response != nil
      devicesJSON = response['devices']
    end

    devices = Hash.new
    devicesJSON.each do |d|
      if d.key?('nickname') and d.key?('iden')
        devices[d['nickname'].upcase] = d['iden']
      end
    end

    return devices
  end

  def self.contacts
    if @@contacts == nil
      @@contacts = get_contacts_dist
    end
    return @@contacts
  end

  def self.devices
    if @@devices == nil
      @@devices = get_devices_dist
    end
    return @@devices
  end

  def self.channels
    if @@channels == nil
      @@channels = get_channels_dist
    end
    return @@channels
  end
end