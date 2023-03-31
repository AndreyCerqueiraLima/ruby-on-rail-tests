class Companies::UsersController < ApplicationController
  before_action :set_company
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to company_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def user_params
    params.require(:user).permit([:email,:password,:password_confirmation, :company_id])
  end

end
