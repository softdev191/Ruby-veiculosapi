class CreateDonos < ActiveRecord::Migration[6.0]
  def change
    create_table :donos do |t|
      t.string :nome
      t.date :data_nascimento
      t.date :data_compra
      t.date :data_venda
      t.references :veiculo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
