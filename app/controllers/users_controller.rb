class UsersController < ApplicationController
  def update
    current_user.update(user_params)
    redirect_back(fallback_location: root_path)
  end

  private
  def user_params
    params.require(:user).permit(:email, :profile)
  end
end
