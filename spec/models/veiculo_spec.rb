require 'rails_helper'

RSpec.describe Veiculo, type: :model do
  let(:veiculo) { create(:veiculo) }

  describe '#validations' do
    
    it 'não é valido com marca vazia' do
      veiculo = FactoryBot.build(:veiculo, marca: nil)
      expect(veiculo).to_not be_valid
    end

    it 'não é valido com veiculo vazio' do
      veiculo = FactoryBot.build(:veiculo, veiculo: nil)
      expect(veiculo).to_not be_valid
    end

    it 'não é valido com ano vazio' do
      veiculo = FactoryBot.build(:veiculo, ano: nil)
      expect(veiculo).to_not be_valid
    end

    it 'não é valido com descricao vazia' do
      veiculo = FactoryBot.build(:veiculo, descricao: nil)
      expect(veiculo).to_not be_valid
    end
  end
end
