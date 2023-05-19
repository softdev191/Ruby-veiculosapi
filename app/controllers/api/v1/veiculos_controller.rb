class Api::V1::VeiculosController < Api::V1::ApiController
  before_action :set_veiculo, only: [:show, :update, :destroy]

  def index
    @veiculos = Veiculo.all.page params[:page]
    render json: {status: 'SUCCESS', message:'Veiculos carregados', data: @veiculos}, status: :ok
  end

  def show
    render json: {status: 'SUCCESS', message:'Veiculo carregado', data: @veiculo}, status: :ok
  end

  def create
    @veiculo = Veiculo.new(veiculo_params)
    if @veiculo.save
      render json: {status: 'SUCCESS', message:'Veiculo criado com sucesso', data: @veiculo}, status: :ok
    else
      render json: {status: 'ERROR', message:'Error ao criar o veiculo', data: @veiculo.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @veiculo.update(veiculo_params)
      render json: {status: 'SUCCESS', message:'Veiculo atualizado com sucesso', data: @veiculo}, status: :ok
    else
      render json: {status: 'ERROR', message:'Error ao atualizar o veiculo', data: @veiculo.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @veiculo.destroy
    render json: {status: 'SUCCESS', message:'Veiculo deletado com sucesso'}, status: 204
  end

  def idade_media
    @veiculo = Veiculo.idade_media(params[:marca])
  end

  private

    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    def veiculo_params
      params.require(:veiculo).permit(:marca, :veiculo, :ano, :descricao, :vendido)
    end
end
