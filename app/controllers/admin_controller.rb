class AdminController < ApplicationController
  before_action :set_user, only: [:update]
  before_action :authenticate_btouser!
  before_action :authorize_admin!

  def index
    @users  = Btouser.all
    @user   = Btouser.new
  end

  def create
    @user = Btouser.new(user_params)
    if @user.save
        redirect_to admin_index_path, notice:' User created'
    else
        redirect_to admin_index_path, notice:' Unable to create user'  
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_index_path, notice:'User Updated'
    else
      redirect_to admin_index_path, notice:'Unable to update user'
    end
  end


  private

  def authorize_admin!
    redirect_to root_path, alert:'Acces Denied' unless current_btouser.admin?
  end
  
  def user_params
    params.required(:btouser).permit(:email,:password,:password_confirmation,:role,:name, :phone, :nickname, :address, :avatar)
    
  end
  
  
  def set_user
    @user = Btouser.find(params[:id])
  end
  
end
