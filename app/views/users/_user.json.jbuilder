# frozen_string_literal: true

json.extract! user, :id, :name, :last_name, :id_number, :phone, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
