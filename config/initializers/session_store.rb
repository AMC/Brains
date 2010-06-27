# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Trunk_session',
  :secret      => '5ff46259dc20b8911c6abc89fcce6e00b94310b87b271b58d77674a003df7d72a4b334aa8fc4cc17d67387129a56f3a25d7f9b503e094bcc9fb47f7dcd906675'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
