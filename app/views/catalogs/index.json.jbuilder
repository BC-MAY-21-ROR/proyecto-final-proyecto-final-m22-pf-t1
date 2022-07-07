# frozen_string_literal: true

json.array! @catalogs, partial: 'catalogs/catalog', as: :catalog
