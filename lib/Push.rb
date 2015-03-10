class Push
  @@destinataire
  @@titre
  @@note

  # Constructeur de classe
  def initialize(destinataire = nil, titre = '', note = '')

    @@destinataire = destinataire
    @@titre = ''
    @@note = ''
  end

  #Getters & Setters
  def destinataire
    @@destinataire
  end

  def destinataire=(destinataire)
    @@destinataire = destinataire
  end

  def titre
    @@titre
  end

  def titre=(titre)
    @@titre = titre
  end

  def note
    @@note
  end

  def note=(note)
    @@note=note
  end
end