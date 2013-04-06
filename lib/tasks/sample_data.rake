namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    admin = User.create!(fName: "Admin",
                         lName: "User",
                         email: "admin@facebook.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

    99.times do |n|
      fName  = Faker::Name.name
      lName  = "."
      email = "example#{n+2}@railstutorial.org"
      password  = "password"
      User.create!(fName: fName,
                   lName: lName,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end