class MembershipsController < ApplicationController

  def create
    membership = Membership.create!(membership_params)
    render json: membership, status: :created
    end

  private

					def find_bird
						Bird.find(params[:id])
					end

					def membership_params
						params.permit(:charge, :gym_id, :client_id)
					end


end
