class UserAuthsController < ApplicationController
  before_action :set_user_auth, only: [:show, :edit, :update, :destroy]

  # GET /user_auths
  # GET /user_auths.json
  def index
    @user_auths = UserAuth.all
  end

  # GET /user_auths/1
  # GET /user_auths/1.json
  def show
  end

  # GET /user_auths/new
  def new
    @user_auth = UserAuth.new
  end

  # GET /user_auths/1/edit
  def edit
  end

  # POST /user_auths
  # POST /user_auths.json
  def create
    @user_auth = UserAuth.new(user_auth_params)

    respond_to do |format|
      if @user_auth.save
        format.html { redirect_to @user_auth, notice: 'User auth was successfully created.' }
        format.json { render :show, status: :created, location: @user_auth }
      else
        format.html { render :new }
        format.json { render json: @user_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_auths/1
  # PATCH/PUT /user_auths/1.json
  def update
    respond_to do |format|
      if @user_auth.update(user_auth_params)
        format.html { redirect_to @user_auth, notice: 'User auth was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_auth }
      else
        format.html { render :edit }
        format.json { render json: @user_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_auths/1
  # DELETE /user_auths/1.json
  def destroy
    @user_auth.destroy
    respond_to do |format|
      format.html { redirect_to user_auths_url, notice: 'User auth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_auth
      @user_auth = UserAuth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_auth_params
      params.require(:user_auth).permit(:email, :crypted_password, :salt)
    end
end
