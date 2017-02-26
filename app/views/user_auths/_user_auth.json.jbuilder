json.extract! user_auth, :id, :email, :crypted_password, :salt, :created_at, :updated_at
json.url user_auth_url(user_auth, format: :json)