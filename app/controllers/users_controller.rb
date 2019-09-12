class UsersController < ApplicationController
  before_action :authenticate_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = current_user.users
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = current_user.users.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = current_user.users.new(user_params)
    if @user.save
      @users = current_user.users
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    modified_params = user_params
    modified_params.delete("password") if modified_params["password"].empty?
    if @user.update(modified_params)
      @users = current_user.users
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def settings 
  end

  def update_settings
    user = current_user
    if user.update(max_leaves: params[:max_leaves])
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :admin_id)
  end
end
