class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def google_oauth2
    user_info = request.env["omniauth.auth"].info
    uid       = request.env["omniauth.auth"].uid
    @user     = User.find_or_create_from_google(user_info, uid)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication, notice: "Thanks for signing in."
    else
      redirect_to new_user_registration_path, alert: "Sorry we have trouble creating your account"
    end
  end

  def facebook

  end

  def twitter

  end



end