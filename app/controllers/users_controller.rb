class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def after_sign_up_path_for(resource)
    redirect_to user_path(current_user.id)
  end
  
  #アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    redirect_to user_path(current_user.id)
  end
end
