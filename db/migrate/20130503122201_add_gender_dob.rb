class AddGenderDob < ActiveRecord::Migration
  def change
  	add_column :users, :gender, :char, default: "M"
  	add_column :users, :dob, :date
  end
end
