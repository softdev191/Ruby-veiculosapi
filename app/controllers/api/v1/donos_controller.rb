class Api::V1::DonosController < Api::V1::ApiController
  before_action :set_veiculo, only: [:create]

  def create
    @dono = Dono.new(dono_params)
    @dono.veiculo = @veiculo
    if @dono.save
      render json: {status: 'SUCCESS', message:'Veiculo criado com sucesso', data: @dono}, status: :ok
    else
      render json: {status: 'ERROR', message:'Error ao criar o veiculo', data: @dono.errors}, status: :unprocessable_entity
    end
  end

  private
    def set_veiculo
      @veiculo = Veiculo.find(params[:veiculo_id])
    end

    def dono_params
      params.require(:dono).permit(:nome, :data_nascimento, :data_compra, :data_venda)
    end
end
