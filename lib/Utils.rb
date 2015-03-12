require_relative 'AccountUtils'

class Utils

  def self.find_receiver_type(receiver)

    if receiver =~ /^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$/
        return [:email, receiver]
    elsif AccountUtils.contacts.key?(receiver.upcase)
        return [:email, AccountUtils.contacts[receiver.upcase]]
    elsif AccountUtils.devices.key?(receiver.upcase)
        return [:device_iden, AccountUtils.devices[receiver.upcase]]
    elsif AccountUtils.channels.key?(receiver.upcase)
        return [:channel_tag, AccountUtils.channels[receiver.upcase]]
    else
          puts 'Indiquez le mail, le nom de la personne, le device, ou le channel à pusher.'
          STDOUT.flush
          receiver_in = STDIN.gets
          return Utils.find_receiver_type receiver_in.delete!("\n")
    end

  end
end