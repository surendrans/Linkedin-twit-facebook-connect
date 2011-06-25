class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth =request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    if authentication
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:provider => auth['provider'], :uid => auth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      user = User.new
      p "=================================1"
      user.apply_omniauth(auth)
      p "2222222222222222"
      p "--------------------------111111"
      if user.save
        p "ifffffffffffffff"
        flash[:notice] = "Authentication successful."
        redirect_to(:user, user)
      else
        p "ifffffffffffffff111111"
        session[:omniauth] = auth.except('extra')
        redirect_to new_user_registration_url
      end
      p "--------------------------1111112222"
    end
  end

  def destroy

    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url  
  end
end
