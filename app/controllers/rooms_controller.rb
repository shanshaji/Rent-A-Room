class RoomsController < ApplicationController
  load_and_authorize_resource
	
  def index
  
   @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end

  def create
  	@room = Room.new(room_params)
  	@room.user_id = current_user.id
   	
  	if @room.save
  		redirect_to rooms_path(@room.id), notice: "The room was sucessfully created"
  	else
  		render action: 'new'
  	end
  end

  def show
  	@room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])

  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      redirect_to room_path(@room.id), notice: "room was sucessfully updated"
    else
      render action: "edit"
    end
  end

  def my_rooms
    @rooms = current_user.rooms
  end

  private

  def room_params
    params[:room].permit(:name,:description,:rules,:user_id,:price,:city_id,:address,:images,:is_authorized )
  end
  
end
