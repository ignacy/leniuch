# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_leniuch_session',
  :secret      => '6f8dfd6c8ee9e1d0dacebb0321b4db538778f9ef06c6659d5505970c350b4a297b76caea7990c85eb0fcc22f6940e59da22339bba950faf015e57d3b4a95542a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
