class Projeto < ActiveRecord::Base

  validates :nome,:descricao,
            :presence => {:message => "não pode ser nulo"}

  validates :descricao,
            :custom => {:tamanho=>3,:message => "deve ter mais de 3 carcateres"}

  has_and_belongs_to_many :analistas

  #Apaga os analistas do projeto para exlcuir o projeto
  before_destroy {|projeto| projeto.analistas.clear}

end
