class Recaptcha
  RECAPTCHA_PRIVATE_KEY = '6LdbgdoSAAAAAL5JbVbLpqYSeoRUEVT9uLNXbkBE'
  def self.verify(args)
    url = 'http://www.google.com/recaptcha/api/verify'
    query_parts = []
    query_parts << "privatekey=#{'6LdbgdoSAAAAAL5JbVbLpqYSeoRUEVT9uLNXbkBE'}"
    query_parts << "remoteip=#{args[:ip_address]}"
    query_parts << "challenge=#{args[:recaptcha_challenge_field]}"
    query_parts << "response=#{args[:recaptcha_response_field]}".gsub(' ', '+')
 
    begin
      response = Curl::Easy.http_get("#{url}?#{query_parts.join('&')}") do |curl|
        curl.connect_timeout = 2
        curl.timeout = 5
      end
    rescue Exception
      return false
    end
 
    result = response.body_str.split("\n")
    return result[0]
  end
end