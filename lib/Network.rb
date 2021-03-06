require_relative 'Constants'
require 'rest_client'
require 'json'

class Network

  @@URL_ME = 'https://api.pushbullet.com/v2/users/me'
  @@URL_DEVICES = 'https://api.pushbullet.com/v2/devices'
  @@URL_CONTACTS = 'https://api.pushbullet.com/v2/contacts'
  @@URL_PUSH = 'https://api.pushbullet.com/v2/pushes'
  @@URL_CHANNELS = 'https://api.pushbullet.com/v2/subscriptions'

  @@token = nil

  HTTP_STATUS_OK = 200
  HTTP_STATUS_FORBIDDEN = 401

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
    rescue RestClient::Exception => e
      if e.http_code == HTTP_STATUS_FORBIDDEN
        puts 'Token faux'
        self.token= nil
        puts self.token
        return self.request method, url, object
      else puts e.http_code
      end
    end

    if response != nil
      return JSON.parse response
    else return nil
    end
  end

  def self.token

    token_path = File.expand_path(Constants.TOKEN_FILE)

    if ENV[Constants.TOKEN_ENV]
      @@token = ENV[Constants.TOKEN_ENV]
    elsif File.exists?(token_path)
        @@token = File.read(token_path).strip
    else @@token == nil
      puts 'Indiquez votre Token'
      STDOUT.flush
      self.token= STDIN.gets.delete!("\n")
    end

    @@token
  end

  def self.token=(token)

    if ENV[Constants.TOKEN_ENV]
      ENV[Constants.TOKEN_ENV] = token
    end

    token_path = File.expand_path(Constants.TOKEN_FILE)
    File.write(token_path, token)

    @@token = token
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

  def self.URL_CHANNELS
    @@URL_CHANNELS
  end

end