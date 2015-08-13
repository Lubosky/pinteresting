class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@pins = Pin.all
	end

	def show		
	end

	def new
		@pin = current_user.pins.build
	end

	def create
		@pin = current_user.pins.build(pin_params)
		if @pin.save
			redirect_to @pin, notice: "You successfuly created new Pin"
		else
			render 'new'
		end	
	end

	def edit
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Your Pin has been successfuly updated"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
			redirect_to root_path		
	end

	private

		def pin_params
			params.require(:pin).permit(:description)
		end

		def correct_user
			@pin = current_user.pins.find_by(id: params[:id])
			if @pin.nil?
				redirect_to pins_path, notice: "Hey #{@current_user.name}, we are sorry but you are not authorized to perform this action!"
			end
		end

		def find_pin
			@pin = Pin.find_by(id: params[:id])
		end

end
