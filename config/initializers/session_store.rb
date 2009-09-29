# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_foosball_session',
  :secret      => 'bc32d81bc45dab4df0ea51c43ae4c8cafb993f0737a1d62ce89e2481a1dc8a4e9af9b8958ac416d64924c18796df5ac1035f79e842fa7786ad0ef041ecab79cb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
