# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_police_complaints_session',
  :secret      => 'a79ac840b95034d70f1a62e3cadf44689c451ebfde32f43f64a4579ee485be395509e10f4e8484431509a8e1d31ea5cf5e0c8be68d0e53e05518acca914e7175'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
