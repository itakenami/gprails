class Analista < ActiveRecord::Base
  validates :nome,:especialidade,
            :presence => {:message => "não pode ser nulo"}

  validates :especialidade,
            :custom => {:tamanho=>3,:message => "deve ter mais de 3 carcateres"}

  belongs_to :cargo
  has_and_belongs_to_many :projetos
end
