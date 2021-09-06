require 'swagger_helper'

describe 'User API' do

  path '/api/v1/signup' do

    post 'Creates a user' do
      tags 'User Authontication'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          emaill: { type: :string },
          password: { type: :string }
          password_confirmation: {type: :string}
          role: {type: :string}
        },
        required: [ 'username', 'email' ]
      }
      response '201', 'user created' do
        let(:user) { { username: 'shael', email: 'shael@gmail.com',password: "123456",password_confirmation: "123456",role: "User" } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { username: 'foo' } }
        run_test!
      end
    end
  end

  # path '/api/v1/pets/{id}' do

  #   get 'Retrieves a pet' do
  #     tags 'Pets'
  #     produces 'application/json', 'application/xml'
  #     parameter name: :id, :in => :path, :type => :string

  #     response '200', 'name found' do
  #       schema type: :object,
  #         properties: {
  #           id: { type: :integer, },
  #           name: { type: :string },
  #           photo_url: { type: :string },
  #           status: { type: :string }
  #         },
  #         required: [ 'id', 'name', 'status' ]

  #       let(:id) { Pet.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
  #       run_test!
  #     end

  #     response '404', 'pet not found' do
  #       let(:id) { 'invalid' }
  #       run_test!
  #     end
  #   end
  # end
end