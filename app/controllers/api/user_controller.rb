# frozen_string_literal: true

class Api::UserController < Api::BaseController

  def show
    user = User.find_by(slug: request_params[:slug])
    if user
      render json: user
    else
      render json: "Invalid user", status: :not_found
    end
  end

  private

  # only allow the white list through.
  def request_params
    params.permit(:slug)
  end
end
