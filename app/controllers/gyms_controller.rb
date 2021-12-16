class GymsController < ApplicationController
  before_action :find_gym, only: [:show, :destroy, :update]

  def show
    render json: @gym, status: :ok
  end

  def destroy
    @gym.destroy
    head :no_content
  end

  def index
    gyms = Gym.all
    render json: gyms, status: :ok
  end

  def update
    @gym.update!(gym_params)
    render json: @gym, status: :accepted

  end


  private

  def gym_params
    params.permit(:name, :address)
  end

					def find_gym
						@gym = Gym.find(params[:id])
          end

          def render_not_found_response
            render json: {error: "Gym not found"}, status: :not_found
          end

end
