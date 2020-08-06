class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]


  def index
    @users = User.where.not(id: [[current_user] + current_user.following]).order('created_at DESC')
    @hint = current_user.hints.build
    @hints = Hint.all.order('created_at DESC')
  end

  def show
    @user_show = set_user
    @users = @user_show.followers
    @hints = @user_show.show_hints.order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def edit; end


  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to new_session_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: 'User name already taken' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :fullname, :image, :coverimage)
  end
end
