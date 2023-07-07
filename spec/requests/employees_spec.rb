require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /index" do
    it 'returns all employees' do 
      employee1 = create(:employee)
   
      
      get '/employees'

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq([employee1].to_json)
    end
  end
end
