require 'Push'
require 'Network'

class PushNote < Push

  # Constructeur de classe
  def initialize(destinataire = nil, titre = '', note = '')

    @@destinataire = destinataire
    @@titre = ''
    @@note = ''
  end

  def push
    push = JSON.generate(
        {
            :email => 'justine.dewilde.pro@gmail.com',
            :type => 'note',
            :title => 'OUIIIIII',
            :body => 'Note Body'
        }
    )
    Network.request(:post, Network.URL_PUSH, push)
  end

end