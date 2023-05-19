require 'rails_helper'

RSpec.describe Dono, type: :model do
  let(:dono) { create(:dono) }
  
  describe '#validations' do
    
    it 'não é valido com nome vazio' do
      dono = FactoryBot.build(:dono, nome: nil)
      expect(dono).to_not be_valid
    end

    it 'não é valido com veiculo vazio' do
      dono = FactoryBot.build(:dono, veiculo: nil)
      expect(dono).to_not be_valid
    end

    it 'não é valido com data de nascimento vazio' do
      dono = FactoryBot.build(:dono, data_nascimento: nil)
      expect(dono).to_not be_valid
    end

    it 'não é valido com data de compra vazia' do
      dono = FactoryBot.build(:dono, data_compra: nil)
      expect(dono).to_not be_valid
    end

    it 'não é valido com data de venda vazia' do
      dono = FactoryBot.build(:dono, data_venda: nil)
      expect(dono).to_not be_valid
    end

    it 'não é valido com a data de compra maior que venda' do
      dono = FactoryBot.build(:dono, data_compra: Date.today+2.days, data_venda: Date.today)
      dono.save
      expect(dono.errors[:data_compra]).to eq(['Data de compra não pode ser maior qua data de venda'])
    end
  end
end
