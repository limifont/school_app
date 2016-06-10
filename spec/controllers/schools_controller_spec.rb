require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  let(:school) { FactoryGirl.create(:school)}

  describe "GET #index" do
    before(:each) do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'sets schools instance var' do
      school
      expect(assigns[:schools]).to eq([school])
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, id: school.id
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'sets school instance var' do
      expect(assigns[:school]).to eq(school)
    end
    
    it 'renders show template' do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'sets school instance var' do
      school = assigns[:school]
      expect(school.id).to be_nil
      expect(school.class).to eq(School)
    end

    it 'renders new template' do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before(:each) do
          @school_params = {
            school: FactoryGirl.attributes_for(:school)
          }
        end

    it 'has http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    before(:each) do
      get :edit, id: school.id
    end

    it 'has http success' do
      expect(response).to have_http_status(:success)
    end

    it 'finds the right school' do
      expect(assigns[:school]).to eq(school)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    before(:each) do
      put :update, {id: school.id, school: {name: 'Whatever'}}
    end

    it 'has http success' do
      expect(response).to have_http_status(302)
    end

    it 'updates the school' do
      expect(school.reload.name).to eq('Whatever')
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      delete :destroy, id: school.id
    end

    it 'has http success' do
      expect(response).to have_http_status(302)
    end

    it 'deletes a robot' do
      expect(School.count).to eq(0)
    end
  end
end
