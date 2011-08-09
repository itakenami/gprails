class Cargo < ActiveRecord::Base
  require "custom_validator"
  validates :nome,
            :presence => {:message => "não pode ser nulo"},
            :custom => {:tamanho=> 3, :message => "deve ser maior que 3 caracteres"}


end
