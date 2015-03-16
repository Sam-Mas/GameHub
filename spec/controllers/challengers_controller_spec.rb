require 'rails_helper'

RSpec.describe ChallengersController, type: :controller do

	context 'when signing in with invalide username' do
		it 'should tell you it is invalid and keep you on the login page' do
			post :create, challenger: { name: "" }
			expect(flash[:danger]).to eq('Invalid username, please only use letters and numbers, of a length between 1 and 30')
			expect(response).to render_template(:new)
		end

		it 'should tell you it is invalid and keep you on the login page' do
			post :create, challenger: { name: "Guest123456" }
			expect(flash[:danger]).to eq('Invalid username, please only use letters and numbers, of a length between 1 and 30')
			expect(response).to render_template(:new)
		end

		it 'should tell you it is invalid and keep you on the login page' do
			post :create, challenger: { name: "_" }
			expect(flash[:danger]).to eq('Invalid username, please only use letters and numbers, of a length between 1 and 30')
			expect(response).to render_template(:new)
		end

		it 'should tell you it is invalid and keep you on the login page' do
			post :create, challenger: { name: "Bad_Username" }
			expect(flash[:danger]).to eq('Invalid username, please only use letters and numbers, of a length between 1 and 30')
			expect(response).to render_template(:new)
		end
	end

	context 'when signing in with valide username' do
		it 'should tell you it is valide and redirct you to main page' do
			post :create, challenger: { name: "Sam" }
			expect(flash[:notice]).to be_present
			expect(response).to redirect_to(root_path)
		end

		it 'should tell you it is invalid and keep you on the login page' do
			post :create, challenger: { name: "Sam" }
			expect(flash[:notice]).to eq('new challenger created')
			expect(response).to redirect_to(root_path)
		end

		it 'should tell you it is invalid and keep you on the login page' do
			test = Challenger.new
			test.name = "Sam"
			test.save
			post :create, challenger: { name: "Sam" }
			expect(flash[:notice]).to eq('challenger successfully loaded')
			expect(response).to redirect_to(root_path)
		end
	end

end
