require 'rails_helper'

RSpec.describe School, type: :model do
  let(:school) { FactoryGirl.create(:school)}

  describe 'validations' do
    it {should respond_to :name }
    it {should respond_to :level }
  end

  describe 'mechanics' do
    before(:each) do
      @school1 = School.create(name: 'Mom School', level: '1')
      @school2 = School.create(name: 'Dad School', level: '2')
      @school3 = School.create(name: 'Reeg Academy', level: '3')
    end

    it 'orders schools alphabetically' do
      schools = School.by_name
      expect(schools).to eq([@school2, @school1, @school3])
    end

    it 'orders schools by level' do
      schools = School.by_level
      expect(schools).to eq([@school1, @school2, @school3])
    end

    it 'gives info about the school' do
      expect(school.info).to eq("The school #{school.name}, serves those of #{school.level} age.")
    end
  end
end
