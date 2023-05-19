class Veiculo < ApplicationRecord
  paginates_per 30

  has_many :donos

  validates :marca, :veiculo, :ano, :descricao, presence: true

  def self.idade_media
    Dono.joins(:veiculo).where(veiculos: {marca: 'Yamaha'}).select('AVG(AGE(donos.data_nascimento)) as media_idade').to_a.first.media_idade
  end
end
