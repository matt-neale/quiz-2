require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  describe "#new" do
    context "with user signed in" do
      before do
        session[:user_id]=FactoryBot.create(:user).id
      end
      it "renders the new template " do
        get(:new) 
        expect(response).to(render_template(:new))
      end
      it "sets an instance variable with a new idea" do
        get(:new)
        expect(assigns(:idea)).to(be_a_new(Idea))
      end 
    end
  end
  describe '#create' do
    def valid_request
      post(:create, params:{idea: FactoryBot.attributes_for(:idea)})  
    end
    context "with user signed in" do
      before do
        session[:user_id]=FactoryBot.create(:user)
      end
      context "with valid request" do
        it "creates a idea in the database" do
          
          count_before=Idea.count
          valid_request
          count_after=Idea.count
          expect(count_after).to(eq(count_before+1))
        end
        it " redirects us to the show page for the idea" do
          valid_request
          idea= Idea.last
          expect(response).to(redirect_to(idea_url(idea.id)))
        end
      end
      context "with invalid request" do
        def invalid_request
          post(:create, params:{idea: FactoryBot.attributes_for(:idea, title: nil)}) 
        end
        it "does not save a record in the database" do
          count_before= Idea.count
          invalid_request
          count_after=Idea.count
          expect(count_after).to eq(count_before)
          
        end
        it "renders the new template" do
          invalid_request
          expect(response).to render_template(:new)
        end
        
      end
      
    end
    context "with user not signed in" do
      it "should redirect to sign in page" do
        valid_request
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
