# frozen_string_literal: true

json.extract! catalog, :id, :reference, :name, :description, :price, :actived, :created_at, :updated_at
json.url catalog_url(catalog, format: :json)
