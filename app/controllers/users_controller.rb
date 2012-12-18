class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    #if verify_recaptcha :private_key => '6Ldmg9oSAAAAAOVK65YIoU_2iaKZY5OgIHEchFK-' && @user.save
    if @user.save
        sign_in @user
        flash[:success] = "Welcome to Mini Roomer!"
        redirect_to @user
    else
      render 'new'
    end
  end


end
