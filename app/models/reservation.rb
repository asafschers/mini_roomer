class Reservation < ActiveRecord::Base
  attr_accessible :ResCancelationCause, :ResCheckIn, :ResCheckOut, :ResConfirmationNum, :ResNumAdults, :ResNumChildren, :ResSource,
                  :latitude, :longitude, :gmap
  #belongs_to :user
  #belongs_to :hotel
  acts_as_gmappable

  #validates :UserId, presence: true
  #validates :HotelId, presence: true
  #validates :ResCancelationCause, presence: true
  #validates :ResCheckIn, presence: true
  #validates :ResCheckOut, presence: true
  #validates :ResConfirmationNum, presence: true
  #validates :ResNumAdults, presence: true
  #validates :ResNumChildren, presence: true
  #validates :ResSource, presence: true



  def gmaps4rails_address
    "#{self.ResCancelationCause}, #{self.ResSource}"
  end

end
