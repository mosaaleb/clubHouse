# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def sign_in(user)
    session[:user_id] = user.id
  end

  def remember_user(user)
    cookies.permanent[:token] = user.remember_token
  end

  def sign_out
    cookies.delete(:token)
    flash[:success] = 'You have signed out!'
    redirect_to homes_path
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies.permanent[:token])
  end

end
