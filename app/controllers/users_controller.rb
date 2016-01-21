class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  # GET /users/1
  def show
    render json: @user
  end

  def index
    render json: current_user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: ErrorsSerializer.serialize(@user.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: ErrorsSerializer.serialize(@user.errors), status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      UnderscoreParams.process(
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [
          :email, :'first-name', :'last-name', :password, :'password-confirmation'
        ])
      )
    end
end
