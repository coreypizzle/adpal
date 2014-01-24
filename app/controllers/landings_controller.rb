class LandingsController < ApplicationController
  def index
  	@landing = Landing.new
  end

  def new
	@landing = Landing.new
  end

  def create
  	@landing = Landing.new(params[:landing].permit(:email))
  	if @landing.save
    	redirect_to root_path
    	flash[:notice] = "Thanks for signing up! We'll get back to you soon!"
  	else
    	redirect_to root_path
  	end
  end

  def destroy
  	@landing = Landing.all
  	@landing.destroy
  end

  private
  def landing_params
    params.require(:landing).permit(:email)
  end
end
