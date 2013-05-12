namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
   admin = User.create!(fName: "Admin",
                         lName: "User",
                         email: "admin@frakebook.com",
                         password: "administrator",
                       password_confirmation: "administrator")
  admin.toggle!(:admin)

  66.times do |n|
     fName  = Faker::Name.first_name
     lName  = Faker::Name.last_name
     email = "#{fName}#{lName}#{n+3}@lhr.nu.edu.pk"
    password  = "123456"
	if User.create!(fName: fName,
                 lName: lName,      
                 email:    email,
                 password: password,
                 password_confirmation: password,
                 gender: "M")
	else
	end
  end
end

def make_microposts
  users = User.all(limit: 30)
  20.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.posts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  friend_users = users[3..50]
  adders      = users[4..40]
  friend_users.each { |friend| user.make_friend!(friend) }
  adders.each      { |adder| adder.make_friend!(user) }
end



###############################################################################
