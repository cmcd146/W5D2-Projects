class SubsController < ApplicationController
  before_action :require_mod, only: [:edit, :update]
  
  def index 
    @subs = Sub.all
  end 
  
  def show 
    @sub = Sub.find(params[:id])
  end 
  
  def new 
    @sub = Sub.new
  end 
  
  def create 
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end 
  
  def edit 
    @sub = Sub.find(params[:id])
  end 
  
  def update 
    @sub = Sub.find(params[:id])
    unless @sub.update_attributes(sub_params)
      flash[:errors] = @sub.errors.full_messages
    end
    redirect_to sub_url(@sub)
  end 
  
  # def destroy 
  # end 
  
  def require_mod
    @sub = Sub.find(params[:id]) 
    @sub.moderator == current_user
  end
  
  private
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
