require 'Network'

class PushFile

  @file

  # Constructeur de classe
  def initialize(destinataire = nil, titre = '', note = '')

    @destinataire = destinataire
    @titre = titre
    @note = note
  end

  def push
    #PUSH
  end

  #Getters & Setters

  def file
    @file
  end

  def file=(file)
    @file=file
  end

end