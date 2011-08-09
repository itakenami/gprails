class CreateProjetos < ActiveRecord::Migration
  def self.up
    create_table :projetos do |t|
      t.string :nome
      t.text :descricao
      t.date :data_inicio
      t.date :data_fim
    end
  end

  def self.down
    drop_table :projetos
  end
end
