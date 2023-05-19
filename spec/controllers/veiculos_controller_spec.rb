require 'rails_helper'

RSpec.describe Api::V1::VeiculosController, type: :controller do
  let (:veiculo) { create(:veiculo) }

  context 'GET #index' do

    it 'acessa index com sucesso' do
      get :index

      expect(response).to have_http_status(200)
    end

    it 'recebe um array vazio' do
      get :index

      expect(assigns(:veiculos)).to be_empty
    end

    it 'recebe um ou mais veiculos' do
      veiculo
      get :index

      expect(assigns(:veiculos)).to_not be_empty
    end
  end

  context 'GET #show' do

    it 'acessa show com sucesso' do
      get :show, params: { id: veiculo.id }

      expect(response).to have_http_status(200)
    end

    it 'retorna um veiculo existente' do
      get :show, params: { id: veiculo.id }

      expect(assigns(:veiculo)).to be_a(Veiculo)
      expect(assigns(:veiculo)).to eq(veiculo)
    end

  end

  context 'POST #create' do
    let!(:params) {
      {
        marca: 'Toyota',
        veiculo: Faker::Vehicle.model(make_of_model: 'Toyota'),
        ano: Faker::Vehicle.year,
        descricao: Faker::Vehicle.standard_specs[3],
        vendido: Faker::Boolean.boolean
      }
    }

    it 'criando veiculo com sucesso' do
      post :create, params: { veiculo: params }

      expect(response).to have_http_status(200)
    end

    it 'criando veiculo com erro' do
      params = { marca: 'Toyota' }
      post :create, params: { veiculo: params }

      expect(response).to have_http_status(422)
    end
  end

  context 'PUT #update' do
    
    it 'atualiza veiculo com sucesso' do
      params = { marca: 'Honda' }
      put :update, params: { id: veiculo.id, veiculo: params }
      veiculo.reload

      expect(response).to have_http_status(200)
    end

    it 'atualiza veiculo com erro' do
      params = { marca: nil }
      put :update, params: { id: veiculo.id, veiculo: params }
      veiculo.reload

      expect(response).to have_http_status(422)
    end

  end

  context 'DELETE #destroy' do

    it 'exclui veiculo com sucesso' do
      delete :destroy, params: { id: veiculo.id }

      expect(response).to have_http_status(204)
    end

  end
end