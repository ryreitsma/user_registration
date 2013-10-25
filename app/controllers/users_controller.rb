class UsersController < ApplicationController
  protect_from_spam only: :create

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user].permit(:name, :email))

    if @user.save
      UserMailer.registration_email(@user).deliver
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

private
  def honeypot_field
    params[:user][honeypot_field_name]
  end

  def honeypot_response
    user_params = params[:user]
    user_params.delete(honeypot_field_name)

    render json: User.fake(user_params), status: :created
  end

  def strip_honeypot_param
    params[:user].delete(honeypot_field_name)
  end
end
