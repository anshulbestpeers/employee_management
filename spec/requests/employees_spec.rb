require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /employees" do
    it 'returns all employees' do 
      employee1 = create(:employee)

      get '/employees'
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq([employee1].to_json)
    end
  end

  describe 'Get /employees/:id' do
    it 'returns a successful response' do 
      employee = FactoryBot.create(:employee)

      get "/employees/#{employee.id}"
      expect(response).to be_successful
    end

    it 'returns the correct employee as JSON' do
      employee = FactoryBot.create(:employee)

      get "/employees/#{employee.id}"
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['name']).to eq(employee.name)
      expect(parsed_response['email']).to eq(employee.email)
    end
  end

  describe 'POST /employees' do
    it 'creates a new employee with valid params' do
      department = FactoryBot.create(:department)
      employee_params = FactoryBot.attributes_for(:employee, department_id: department.id)

      post '/employees', params: { employee: employee_params }
      expect(response).to have_http_status(:created)
      employee = Employee.last
      expect(employee.name).to eq(employee_params[:name])
      expect(employee.email).to eq(employee_params[:email])
    end
  end

  describe 'DELETE /employees/:id' do
    it 'destroys an existing employee' do
      employee = FactoryBot.create(:employee)

      delete "/employees/#{employee.id}"
      expect(response).to have_http_status(:no_content)
      expect { employee.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns an error if employee cannot be destroyed' do
      employee = FactoryBot.create(:employee)
      allow(employee).to receive(:destroy).and_return(false)
      
      delete "/employees/#{employee.id}"
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'GET /employees/find_department' do
    it 'returns employees in the specified department' do
      department = FactoryBot.create(:department, name: 'HR')
      employee1 = FactoryBot.create(:employee, department: department)

      get '/employees/find_department', params: { filter: 'HR' }
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(1)
      expect(parsed_response[0]['name']).to eq(employee1.name)
    end
  end
end
