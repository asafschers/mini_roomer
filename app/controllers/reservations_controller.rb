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
	@reservation.save!

	@json = Reservation.last.to_gmaps4rails

	#flash.now[:error] = Reservation.last.hotel.HotName

  end 

  def show

  end

end
