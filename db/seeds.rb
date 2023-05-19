# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
marcas = ["Yamaha", "Chevrolet", "Volkswagen"]
modelos = [FFaker::Vehicle.model, FFaker::Vehicle.model, FFaker::Vehicle.model]

100.times do
  veiculo = Veiculo.create(
    marca: marcas.sample,
    veiculo: modelos.sample,
    ano: FFaker::Vehicle.year,
    descricao: 'Teste',
    vendido: [true, false].sample
  )
  purchase_date = FFaker::Time.between(Date.parse('1950-01-01'), Date.parse('2001-01-01'))
  sale_date = purchase_date + rand(1..3).years
  rand(1..3).times do
    Dono.create(veiculo: veiculo, 
                nome: FFaker::NameBR.name, 
                data_nascimento: FFaker::Time.between(Date.parse('1950-01-01'), Date.parse('2001-01-01')), 
                data_compra: purchase_date, 
                data_venda: sale_date)
    purchase_date = sale_date
  end
end