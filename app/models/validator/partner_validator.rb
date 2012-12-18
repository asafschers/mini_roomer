class Validator::PartnerValidator < Validator
  validates_with Validator::RecaptchaValidator
 
  attr_accessor(
    :email,
  )   
 
  validates(
    :email, 
    :presence => true
  )
 
end