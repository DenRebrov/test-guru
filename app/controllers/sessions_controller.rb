class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:url]
        redirect_to session[:url]
      else
        redirect_to root_path, noice: 'Добро пожаловать в Guru!'
      end
    else
      render :new, alert: 'Проверьте свои Email и Password пожалуйста'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:url] = nil

    redirect_to root_path, noice: 'Вы разлогинились! Приходите еще!'
  end
end
