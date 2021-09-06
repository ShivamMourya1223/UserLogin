require 'rails_helper'

RSpec.describe User, type: :model do

	describe 'user registration' do
		let(:user) { FactoryBot.build :user, username:"shashi" ,email:'rahul@gmail.com',password: '123456',password_confirmation:'123456',role:'User' }
		it "name,email,username,role, password and password_You can register if confirmation exists" do 
			expect(user).to be_valid # user.valid?Pass if is true end
		end

		let(:user){FactoryBot.create(:user)}
		it 'is not valid without a username' do
			user.username = nil
			expect(user).to_not be_valid
		end

		let(:user){FactoryBot.create(:user)}
		it 'is not valid without a email' do
			user.email = nil
			expect(user).to_not be_valid
		end

		let(:user){FactoryBot.create(:user)}
		it 'is not valid without a password' do
			user.password = nil
			expect(user).to_not be_valid
		end

		let(:user){FactoryBot.create(:user)}
		it 'is not valid without a password_confirmation' do
			user.password_confirmation = nil
			expect(user).to_not be_valid
		end

		it "is valid with valid attributes" do
			expect(user).to be_valid
		end
	end
end
