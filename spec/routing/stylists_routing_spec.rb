# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StylistsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/stylists').to route_to('stylists#index')
    end

    it 'routes to #new' do
      expect(get: '/stylists/new').to route_to('stylists#new')
    end

    it 'routes to #show' do
      expect(get: '/stylists/1').to route_to('stylists#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/stylists/1/edit').to route_to('stylists#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/stylists').to route_to('stylists#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/stylists/1').to route_to('stylists#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/stylists/1').to route_to('stylists#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/stylists/1').to route_to('stylists#destroy', id: '1')
    end
  end
end
