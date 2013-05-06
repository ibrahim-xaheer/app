class AddPicPosts < ActiveRecord::Migration
  def change
   	add_column :posts, :wall_file_name,    :string
    add_column :posts, :wall_content_type, :string
    add_column :posts, :wall_file_size,    :integer
    add_column :posts, :wall_updated_at,   :datetime
end
end
