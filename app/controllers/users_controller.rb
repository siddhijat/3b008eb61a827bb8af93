class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def show
    render json: @user, serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, serializer: UserSerializer
    else
      render json: {errors: user.errors}, adapter: :json
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, serializer: UserSerializer
    else
      render json: {errors: @user.errors}, adapter: :json
    end
  end

  def destroy
    @user.destroy
    render json: {message: "User successfully destroyed"}, adapter: :json
  end

  def typeahead
    search = "%#{params[:search_term].parameterize}%"
    users = User.search(search, fields: [:first_name, :last_name, :email], match: :word_middle, operator: 'or')
    render json: users, each_serializer: UserSerializer 
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
      unless @user.present?
        render json: {error: "User not found"}, adapter: :json
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
