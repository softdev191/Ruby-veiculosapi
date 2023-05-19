require 'rails_helper'

RSpec.describe Api::V1::DonosController, type: :controller do
  let(:veiculo) { create(:veiculo) }

  context 'POST #create' do
    let!(:params) {
      {
        nome: Faker::Name.name,
        data_nascimento: Date.today,
        data_compra: 6.months.ago,
        data_venda: 1.month.ago
      }
    }

    it 'criando dono com sucesso' do
      post :create, params: { veiculo_id: veiculo.id, dono: params }

      expect(response).to have_http_status(200)
    end

    it 'criando dono com erro' do
      params = { nome: 'Carlos' }
      post :create, params: {veiculo_id: veiculo.id, dono: params }

      expect(response).to have_http_status(422)
    end
  end
end