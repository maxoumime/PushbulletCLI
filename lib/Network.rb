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
      return RestClient::Request.new(
          :method => method,
          :url => url,
          :user => @@token,
          :password => '',
          :headers => { :accept => :json,
                        :content_type => :json }
      )
    else return RestClient::Request.new(
        :method => method,
        :url => url,
        :user => @@token,
        :password => '',
        :payload => object,
        :headers => { :accept => :json,
                      :content_type => :json }
    )
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
    @@token
  end

  def self.token=(token)
    @@token = token
  end



end