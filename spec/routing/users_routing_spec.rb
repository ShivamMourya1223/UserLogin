require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  describe 'routing' do

  	it 'routes to #new' do
      expect(get: 'users/sign_in').to route_to('sessions#new')
    end

    it 'routes to #create' do
      expect(post: 'users/sign_in').to route_to('sessions#create')
    end
  end
end