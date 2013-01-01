class ReservationsController < ApplicationController
  def new

  end

  def create


	file_data = params[:uploaded_file][:uploaded_file]

	if file_data.respond_to?(:read)
	  xml_contents = file_data.read
	elsif file_data.respond_to?(:path)
	  xml_contents = file_data.path.read
	else
	  flash.now[:error] = "Bad file"
	end



	Hash.from_xml(xml_contents)["message"]["param"].inject({}) do  |result, elem| 
		  result[elem["name"]] = elem["value"] 
		  @vals = result 
		  
	end

	@hotel = Hotel.new
	@hotel.HotCity = @vals["City"]
	@hotel.HotName = @vals["Hotel name"]
	@hotel.save!

	@reservation = @hotel.reservations.create
	@reservation.ResCheckIn = @vals["Check In"]
	@reservation.ResCheckOut = @vals["Check Out"]
	@reservation.ResConfirmationNum = @vals["Confirmation Number"]
	@reservation.ResNumAdults = @vals["Number of guests"]
	@reservation.ResCost = @vals["Cost"]
	@reservation.ResOTA = @vals["OTA"]
	@reservation.ResOriginalPrice = 0
	@reservation.ResReservedPrice = 0
	@reservation.ResPayment = "Temp"
	@reservation.save!

	@json = Reservation.last.to_gmaps4rails

  	#flash.now[:error] = @reservation

  end 

  def edit
  	@reservation = Reservation.find(params[:id]) 	

  end

  def update
  	@reservation = Reservation.find(params[:id])

  	if @reservation.update_attributes(params[:reservation])
  		flash.now[:success] = "Reservation updated"
  		redirect_to @reservation
  	else
  		render 'edit'
  	end	


  end


  def show
  	@reservation = Reservation.find(params[:id])
  end

end
