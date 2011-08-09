class CreateAnalistas < ActiveRecord::Migration
  def self.up
    create_table :analistas do |t|
      t.string :nome
      t.string :especialidade
      t.references :cargo
    end
    execute <<-SQL
      ALTER TABLE analistas ADD CONSTRAINT fk_analistas_cargo FOREIGN KEY (cargo_id) REFERENCES cargos(id)
    SQL
  end

  def self.down
    drop_table :analistas
  end
end
