class CreateCargos < ActiveRecord::Migration
  def self.up
    create_table :cargos do |t|
      t.string :nome
    end
  end

  def self.down
    drop_table :cargos
  end
end
