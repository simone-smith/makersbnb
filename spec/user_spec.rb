require "user"

describe User do

  it "create and retrieve a new user" do
    User.create(name: "John Doe", email: "johndoe@abc.def", password: "test1234")

    all_usernames = User.all.map { |user| user.name }
    all_emails = User.all.map { |user| user.email }
    expect(all_usernames).to include "John Doe"
    expect(all_emails).to include "johndoe@abc.def"
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: "John Doe", email: "johndoe@abc.def", password: "test1234")

      expect(User.find(user.id).email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

end
