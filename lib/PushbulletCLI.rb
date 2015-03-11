require_relative 'PushbulletCLI/version'
require_relative 'AccountUtils'
require_relative 'PushNote'
require_relative 'PushLink'
require_relative 'Network'

module PushbulletCLI

  Network.token= 'p7SbeXsYv55JCiC3RUdV8hBUQTWQbe0E'

  note = PushNote.new(
      ARGV[0].to_str,
      ARGV[1].to_str,
      ARGV[2].to_str
  )

  response_json = note.push

  print response_json

  print "\n"
end
