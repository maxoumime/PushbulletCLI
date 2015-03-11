require_relative 'Push'
require_relative 'Network'

class PushNote < Push

  # Constructeur de classe
  def initialize(destinataire = nil, titre = '', note = '')

    super destinataire, titre, note
  end

  def push
    push = JSON.generate(
        {
            :email => @destinataire,
            :type => :note,
            :title => @titre,
            :body => @note
        }
    )
    Network.request(:post, Network.URL_PUSH, push)
  end

end