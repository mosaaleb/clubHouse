# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      sign_in(user)
      remember_user(user)
      flash[:success] = "Welcome, #{current_user.username}!"
      redirect_to homes_path
    else
      flash.now[:error] = 'Invalid login details'
      render 'new'
    end
  end

  def destroy
    sign_out
  end
end
