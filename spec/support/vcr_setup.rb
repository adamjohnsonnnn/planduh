require 'vcr'
VCR.configure do |config|
 config.default_cassette_options = {
   :serialize_with => :json,
   :preserve_exact_body_bytes => true,
   :decode_compressed_response => true,
   :record => ENV['TRAVIS'] ? :none : :once
 }
 config.configure_rspec_metadata!
 config.cassette_library_dir = "spec/vcr_cassettes"
 config.hook_into :webmock
end



# require 'spec_helper'

# feature 'External request' do
#  it 'queries FactoryGirl contributors on GitHub' do
#    uri = URI('https://api.yelp.com/v3/events')

#    response = JSON.load(Net::HTTP.get(uri))
#    p response
#    expect(response).to eq 'joshuaclayton'
#  end
# end








# describe YelpResponse do
#   context "when authorizing" do
#     # let(:sessions) { Hash.new }

# context "with a valid token" do
#       before :all do
#         VCR.use_cassette 'TicketIntegration_Providers_Pivotal/authorization_token_valid' do
#           @response = pivotal.valid_token?($ticket_integration_settings['pivotal-token'])
#         end










# # spec/model/your_model_spec.rb
# describe YelpResponses, :vcr => true do
#   describe 'gets response from the API' do
#      it 'return a 200 ok response' do
#        VCR.use_cassette ('https://api.yelp.com/v3/events') do
#           response = call_api('https://api.yelp.com/v3')
#           expect(response.status).to eq 302
#        end
#      end
#   end
# end


# require 'rails_helper'

# RSpec.describe YelpResponse, vcr: :true do

#     describe 'GET response', :type => :request do
#       let(:y)  {YelpResponse.new(name: "") }
#         let(:yelp_withfb) {FactoryBot.create_list(:yelp, 20)}


#         VCR.use_cassette ("https://api.yelp.com/v3/events") do

#         # it 'returns all responses for that request' do
#         #    p y.response.body
#         # p "************************"
#         # end

#           it 'returns status 200 because everything is ok' do
#               p response
#               expect(response).to have_http_status 200
#           end

#       end
#    end
# end
