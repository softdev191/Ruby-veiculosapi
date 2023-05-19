class Dono < ApplicationRecord
  
  belongs_to :veiculo
  
  validates :nome, :data_nascimento, :data_compra, :data_venda, :veiculo_id, presence: true
  validate :data_compra_menor_venda

  def data_compra_menor_venda
    if (data_compra && data_venda) && (data_compra > data_venda)
      errors.add(:data_compra, 'Data de compra não pode ser maior qua data de venda')
    end
  end
end
