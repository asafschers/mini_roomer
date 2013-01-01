class Hotel < ActiveRecord::Base
  attr_accessible :HotAddress, :HotChain, :HotCity, :HotEmail, :HotLatitude, :HotLongitude, :HotName, :HotPostalCode, :HotState
  
  has_many :reservations, dependent: :destroy

  #validates :HotAddress, presence: true
  #validates :HotChain, presence: true
  validates :HotCity, presence: true
  #validates :HotEmail, presence: true
  #validates :HotLatitude, presence: true
  #validates :HotLongitude, presence: true
  validates :HotName, presence: true
  #validates :HotPostalCode, presence: true
  #validates :HotState, presence: true
end
