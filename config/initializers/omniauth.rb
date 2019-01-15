Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['364403287447062'], ENV['f5cd0f8cbcd24b554fbdae50fe96546c']
end
