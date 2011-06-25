Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'HDzLwNWnBPmJIRrAGa7ZQg', 'umbERoNX42mVURCLRagB06mxuB25fi5RUJqRRbKFgxU'
  provider :facebook, 'APP_ID', 'APP_SECRET'
  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end
