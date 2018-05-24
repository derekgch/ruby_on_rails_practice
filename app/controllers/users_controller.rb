class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :destroy, :update]
  before_action :get_all_fridges, only: [:new, :edit]

  def new
    @user = User.new()
  end

  def show

  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path(@user)
    end
  end

  def edit

  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :hunger, fridge_ids: [])

  end

  def get_user
    @user = User.find(params[:id])
  end

  def get_all_fridges
    @fridges = Fridge.all
  end



end
