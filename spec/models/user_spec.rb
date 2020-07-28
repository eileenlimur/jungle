require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = User.new
  end

  describe 'Validations' do
    context "when all fields are entered" do
      it "should save the user object to the database" do
        @user.first_name = "Eileen"
        @user.last_name = "Li"
        @user.email = "ei@leen.com"
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.save!
        expect(@user).to be_valid
      end
    end
    context "when the password and password confirmation do not match" do
      it "user object should contain passwords don't match error" do
        @user.first_name = "Eileen"
        @user.last_name = "Li"
        @user.email = "ei@leen.com"
        @user.password = "password"
        @user.password_confirmation = "pass"
        @user.save
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    context "when the password confirmation field is not entered" do
      it "user object should contain password can't be blank error" do
        @user.first_name = "Eileen"
        @user.last_name = "Li"
        @user.email = "ei@leen.com"
        @user.password = "password"
        @user.save
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end
    context "when the password entered is 5 characters or less" do
      it "user object should contain email is too short error" do
        @user.first_name = "Eileen"
        @user.last_name = "Li"
        @user.email = "ei@leen.com"
        @user.password = "passw"
        @user.password_confirmation = "passw"
        @user.save
        expect(@user.errors.full_messages).to include("Password confirmation is too short (minimum is 6 characters)")
      end
    end
    context "when the password confirmation field is not entered" do
      it "user object should contain email has already been taken error even when cases don't match" do
        @user.first_name = "Eileen"
        @user.last_name = "Li"
        @user.email = "ei@leen.com"
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.save
        @user2 = User.new
        @user2.first_name = "Eileen"
        @user2.last_name = "Li"
        @user2.email = "EI@leen.com"
        @user2.password = "password"
        @user2.password_confirmation = "password"
        @user2.save
        puts @user2.inspect
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
    end
    context "when the first name is missing" do
      it "user object should contain first name can't be empty error" do
        @user.last_name = "Li"
        @user.email = "ei@leen.com"
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.save
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end
    context "when the last name is missing" do
      it "user object should contain last name can't be empty error" do
        @user.first_name = "Eileen"
        @user.email = "ei@leen.com"
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.save
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end
  end
  
  describe ".authenticate_with_credentials" do
    context "when the user enters accurate credentials" do
      it "should return the user object" do
        @user.first_name = "Eileen"
        @user.last_name = "Li"
        @user.email = "ei@leen.com"
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.save!
        expect(User.authenticate_with_credentials("ei@leen.com", "password")).to eq(@user)
      end
    end
    context "when the user enters inaccurate credentials" do
      it "should return nil" do
        @user.first_name = "Eileen"
        @user.last_name = "Li"
        @user.email = "ei@leen.com"
        @user.password = "passwordy"
        @user.password_confirmation = "passwordy"
        @user.save!
        expect(User.authenticate_with_credentials("ei@leen.com", "password")).to eq(nil)
      end
    end
  end
end
