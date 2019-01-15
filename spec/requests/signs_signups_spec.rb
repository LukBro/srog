require 'rails_helper'

RSpec.describe 'SignsSignups', type: :request do
  describe 'GET /signs_signups' do
    it 'works! (now write some real specs)' do
      get signs_signups_path
      expect(response).to have_http_status(200)
    end
  end
end
