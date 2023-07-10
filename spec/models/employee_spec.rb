require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'assciations' do 
    it { should belong_to(:department) }
  end
end
