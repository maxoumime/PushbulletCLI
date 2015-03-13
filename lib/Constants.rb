class Constants

  @@TOKEN_ENV = 'PUSHBULLET_TOKEN'
  @@TOKEN_FILE = '~/.pushbullet_token'

  def self.TOKEN_ENV
    @@TOKEN_ENV
  end

  def self.TOKEN_FILE
    @@TOKEN_FILE
  end
end