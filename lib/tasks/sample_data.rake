namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    admin = User.create!(fName: "Admin",
                         lName: "User",
                         email: "admin@frakebook.com",
                         password: "administrator",
                         password_confirmation: "administrator")
    admin.toggle!(:admin)

    99.times do |n|
      fName  = Faker::Name.first_name
      lName  = Faker::Name.last_name
      email = "#{fName}#{lName}#{n+2}@lhr.nu.edu.pk"
      password  = "password"
      User.create!(fName: fName,
                   lName: lName,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end