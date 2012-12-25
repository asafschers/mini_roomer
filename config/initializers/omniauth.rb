OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '397166127033018', 'fb51ea02ae4d5de82c0d85bd94c6ab31',
  :client_options => {:ssl => {:ca_file => "#{Rails.root}/config/ca-bundle.crt"}} 

end
