$FACEBOOK_KEY    = "331513616909550"
$FACEBOOK_SECRET = "fbde8042208665f7c7ebc8bf63cadca6"

$GOOGLE_KEY      = "68506321525.apps.googleusercontent.com"
$GOOGLE_SECRET   = "r3fpj575FYazMJJaTfdg9fdU"

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :facebook, $FACEBOOK_KEY, $FACEBOOK_SECRET
    # Not giving a fuck for right now  
    #  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
    provider :google_oauth2, $GOOGLE_KEY, $GOOGLE_SECRET, {access_type: 'online', approval_prompt: ''}
end
