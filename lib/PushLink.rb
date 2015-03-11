require_relative 'Network'
require_relative 'Push'

class PushLink < Push

  @url

  # Constructeur de classe
  def initialize(destinataire = nil, titre = '', note = '', url = nil)

    super destinataire, titre, note
    @url = url
  end

  def push
    push = JSON.generate(
        {
            :email => @destinataire,
            :type => :link,
            :title => @titre,
            :body => @note,
            :url => @url
        }
    )
    Network.request(:post, Network.URL_PUSH, push)
  end

  #Getters & Setters
  def lien
    @lien
  end

  def lien=(lien)
    @lien = lien
  end

end