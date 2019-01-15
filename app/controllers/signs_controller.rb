class SignsController < ApplicationController
  def show
    @sign = Sign.find(params[:id])
  end

  def new
    @sign = Sign.new
  end

  def create
    @sign = Sign.new(sign_params)
    if @sign.save

      redirect_to @sign
    else
      render 'new'
    end
  end

   private

  def sign_params
    params.require(:sign).permit(:name, :email, :password, :password_confirmation)
  end
 end
