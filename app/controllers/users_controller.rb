class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@pins = @user.pins.page(params[:page]).per(10)
		redirect_to root_url and return unless user_signed_in?
	end

end