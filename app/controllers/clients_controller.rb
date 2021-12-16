class ClientsController < ApplicationController
  before_action :find_client, only: [:show, :update]


  def show
    render json: @client, status: :ok, serializer: ShowClientSerializer
  end

  def index
    clients = Client.all
    render json: clients, status: :ok
  end

  def update
    @client.update!(client_params)
    render json: @client, status: :accepted
  end

  private

  def client_params
    params.permit(:name, :age)
  end

					def find_client
						@client = Client.find(params[:id])
          end

          def render_not_found_response
            render json: {error: "client not found"}, status: :not_found
          end

end
