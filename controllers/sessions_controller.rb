class SessionsController < ApplicationController
  def destroy
  end

  def create
    if user_authenticated
      session[:user_id] = @user.id
      redirect_to articles # Change 'articles_path' to the appropriate path for your articles home page
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end 

end
