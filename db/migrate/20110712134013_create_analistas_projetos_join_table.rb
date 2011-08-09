class CreateAnalistasProjetosJoinTable < ActiveRecord::Migration
  def self.up
    create_table :analistas_projetos, :id => false do |t|
      t.integer :analista_id
      t.integer :projeto_id
    end
    execute <<-SQL
      ALTER TABLE analistas_projetos
        ADD CONSTRAINT fk_analistasprojetos_analista FOREIGN KEY (analista_id) REFERENCES analistas(id),
        ADD CONSTRAINT fk_analistasprojetos_projeto FOREIGN KEY (projeto_id) REFERENCES projetos(id)
    SQL
  end

  def self.down
    drop_table :analistas_projetos
  end
end
