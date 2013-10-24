class UsersController < ApplicationController
  protect_from_spam only: :create

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

private
  def user_params
    @user_params ||= params[:user].permit(:name, :email)
  end

  def honeypot_field
    params[:user][honeypot_field_name]
  end

  def honeypot_response
    render json: User.fake(user_params), status: :created
  end
end
