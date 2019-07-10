class SessionsController < ApplicationController

  class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(name: auth['name'], uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.uid = auth['info']['uid']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
end
