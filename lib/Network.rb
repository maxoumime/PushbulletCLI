require 'rest_client'
require 'json'

class Network

  @@URL_ME = 'https://api.pushbullet.com/v2/users/me'
  @@URL_DEVICES = 'https://api.pushbullet.com/v2/devices'
  @@URL_CONTACTS = 'https://api.pushbullet.com/v2/contacts'
  @@URL_PUSH = 'https://api.pushbullet.com/v2/pushes'

  @@token

  HTTP_STATUS_OK = '200'
  HTTP_STATUS_FORBIDDEN = '401'

  def self.request(method, url, object = nil)

    if object.equal?(nil)
      request = RestClient::Request.new(
          :method => method,
          :url => url,
          :user => self.token,
          :password => '',
          :headers => { :accept => :json,
                        :content_type => :json }
      )
    else request = RestClient::Request.new(
        :method => method,
        :url => url,
        :user => self.token,
        :password => '',
        :payload => object,
        :headers => { :accept => :json,
                      :content_type => :json }
    )
    end

    begin
      response = request.execute
    rescue => e
      print e
    end

    if response != nil
      return JSON.parse response
    else return response
    end
  end

  def self.URL_ME
    @@URL_ME
  end

  def self.URL_DEVICES
    @@URL_DEVICES
  end

  def self.URL_CONTACTS
    @@URL_CONTACTS
  end

  def self.URL_PUSH
    @@URL_PUSH
  end

  def self.token
    if defined? @@token
      @@token
    else
      puts 'Indiquez votre Token'
      STDOUT.flush
      Network.token= STDIN.gets
      @@token
   end
  end

  def self.token=(token)
    @@token = token
  end

end