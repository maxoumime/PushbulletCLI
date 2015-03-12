require_relative 'Push'
require_relative 'Network'
require_relative 'Utils'

class PushNote < Push

  # Constructeur de classe
  def initialize(destinataire = nil, titre = '', note = '')

    super destinataire, titre, note
  end

  def push

    desConfig = Utils.find_receiver_type(@destinataire)
    push = JSON.generate(
        {
            desConfig[0] => desConfig[1],
            :type => :note,
            :title => @titre,
            :body => @note
        }
    )
    Network.request(:post, Network.URL_PUSH, push)
  end

end