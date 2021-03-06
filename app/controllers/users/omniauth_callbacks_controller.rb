class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  end

  def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      else
        flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
        redirect_to new_user_registration_url
      end
    end

    # twitter callback
  def twitter
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
      else
        flash[:error] = 'There was a problem signing you in through Twitter. Please register or try signing in later.'
        redirect_to new_user_registration_url
      end
    end
end
