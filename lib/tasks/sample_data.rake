namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    99.times do |n|
      fName  = Faker::Name.name
      lName  = Faker::Name.name
      email = "example#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(fName: fName,
                   lName: lName,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end