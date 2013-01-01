class Reservation < ActiveRecord::Base
  attr_accessible :ResCancelationCause, :ResCheckIn, :ResCheckOut, :ResConfirmationNum, :ResNumAdults, :ResNumChildren, :ResSource,
                  :latitude, :longitude, :gmap
  #belongs_to :user
  belongs_to :hotel
  acts_as_gmappable

  #validates :ResCancelationCause, presence: true
  #validates :ResCheckIn, presence: true
  #validates :ResCheckOut, presence: true
  validates :ResConfirmationNum, presence: true
  validates :ResNumAdults, presence: true
  #validates :ResNumChildren, presence: true
  #validates :ResSource, presence: true
  validates :ResOriginalPrice, presence: true
  validates :ResReservedPrice, presence: true
  validates :ResPayment, presence: true


  def gmaps4rails_address
      "#{self.hotel.HotName}, #{self.hotel.HotCity}"
  end


end
