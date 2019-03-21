class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name, :text )
  end
end
