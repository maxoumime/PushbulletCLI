require_relative 'PushbulletCLI/version'
require 'rest_client'
require 'json'
require 'AccountUtils'

module PushbulletCLI

  Network.token= 'p7SbeXsYv55JCiC3RUdV8hBUQTWQbe0E'

  if Network.token.equal?(nil) || token.equal?('')
    puts 'Indiquez votre Token'
    STDOUT.flush
    Network.token= gets.chomp
  end

  begin




  print response

  #open(URL_CONTACTS, :http_basic_authentication=>[token, '']) {|f|
  #  f.each_line {|line| response += line}
  #  status = f.status[0]
  #}

  responseJSON = JSON.parse(response)

  print responseJSON

  #contacts = responseJSON['contacts']
  #contacts.each {|c|
  #  if c['active']
  #    print c[:name]
  #    print "\n"
  #  end
  #}

  #devices = responseJSON[:devices]
  #devices.each {|d|
  #  if d[:nickname]
  #    print d[:nickname]
  #    print "\n"
  #  end
  #}

  #print responseJSON

  rescue => e
    print e
  #  status = e.io.status[0]
  #  if status == HTTP_STATUS_FORBIDDEN
  #    print 'Token faux'
  #  end
  end

  print "\n"
end
