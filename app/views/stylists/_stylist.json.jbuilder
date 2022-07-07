# frozen_string_literal: true

json.extract! stylist, :id, :dni, :name, :actived, :role, :created_at, :updated_at
json.url stylist_url(stylist, format: :json)
