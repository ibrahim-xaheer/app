class AddWallPhoto < ActiveRecord::Migration
    def change
  	add_column :users, :wall_file_name,    :string
    add_column :users, :wall_content_type, :string
    add_column :users, :wall_file_size,    :integer
    add_column :users, :wall_updated_at,   :datetime
  end
end
