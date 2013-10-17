class UsersController < ApplicationController
  protect_from_spam only: :create

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

private
  def honeypot_for(action)
    params[:user][honeypot_field_name]
  end

  def honeypot_response_for(action)
    user_params = params[:user]
    user_params.delete(honeypot_field_name)

    fake_user = User.new(user_params)

    render json: fake_user, status: :created
  end
end
