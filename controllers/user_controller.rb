class UserController < ApplicationController
def create
    # ... existing code to create a new user
  
    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_path # Change 'articles_path' to the appropriate path for your articles home page
    else
      render :new
    end
  end
end 