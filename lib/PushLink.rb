require 'Network'

class PushLink

  @@lien

  # Constructeur de classe
  def initialize(destinataire = nil, lien = nil, titre = '', note = '')

    @@destinataire = destinataire
    @@lien = nil
    @@titre = ''
    @@note = ''
  end

  def push
    #PUSH
  end

  #Getters & Setters
  def lien
    @@lien
  end

  def lien=(lien)
    @@lien = lien
  end

end