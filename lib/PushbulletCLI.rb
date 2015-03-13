require_relative 'PushbulletCLI/version'
require_relative 'AccountUtils'
require_relative 'PushNote'
require_relative 'PushLink'
require_relative 'Network'

module PushbulletCLI

  trap('SIGINT') { exit! }

  destinataire = ''
  titre = ''
  note = ''

  Network.token

  arguments = JSON.parse ARGV.inspect

  #Suppresion des arguments parasites
  ARGV.select! { |file| File.exists?(file) }

  if ARGV.empty?
    if arguments[1] != nil
      note = arguments[1]
    else
      puts 'Indiquez votre note'
      STDOUT.flush
      note = STDIN.gets
    end
    if arguments[2] != nil
      titre = arguments[2]
    else
      puts 'Indiquez votre titre'
      STDOUT.flush
      titre = STDIN.gets
    end
  else
    ARGF.each do |line|
      note += line
    end
  end

  if arguments[0] != nil
    destinataire = arguments[0]
  end

  push = PushNote.new(
      destinataire,
      titre,
      note
  )

  push.push

end
