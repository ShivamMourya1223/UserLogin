# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end



# # spec/integration/pets_spec.rb
# require 'swagger_helper'

# describe 'Pets API' do

#   path '/api/v1/pets' do

#     post 'Creates a pet' do
#       tags 'Pets'
#       consumes 'application/json', 'application/xml'
#       parameter name: :pet, in: :body, schema: {
#         type: :object,
#         properties: {
#           name: { type: :string },
#           photo_url: { type: :string },
#           status: { type: :string }
#         },
#         required: [ 'name', 'status' ]
#       }

#       response '201', 'pet created' do
#         let(:pet) { { name: 'Dodo', status: 'available' } }
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:pet) { { name: 'foo' } }
#         run_test!
#       end
#     end
#   end

#   path '/api/v1/pets/{id}' do

#     get 'Retrieves a pet' do
#       tags 'Pets'
#       produces 'application/json', 'application/xml'
#       parameter name: :id, :in => :path, :type => :string

#       response '200', 'name found' do
#         schema type: :object,
#           properties: {
#             id: { type: :integer, },
#             name: { type: :string },
#             photo_url: { type: :string },
#             status: { type: :string }
#           },
#           required: [ 'id', 'name', 'status' ]

#         let(:id) { Pet.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
#         run_test!
#       end

#       response '404', 'pet not found' do
#         let(:id) { 'invalid' }
#         run_test!
#       end
#     end
#   end
# end
