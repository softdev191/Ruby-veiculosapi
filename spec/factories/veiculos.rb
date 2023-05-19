FactoryBot.define do
  factory :veiculo do
    marca { 'Toyota' }
    veiculo { 'Corolla' }
    ano { 2020 }
    descricao { 'Banco de couro' }
    vendido { false }
  end
end
