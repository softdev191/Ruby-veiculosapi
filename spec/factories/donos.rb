FactoryBot.define do
  factory :dono do
    nome { Faker::Name.name  }
    data_nascimento { Date.today }
    data_compra { 6.months.ago }
    data_venda { 1.month.ago }
    veiculo
  end
end
