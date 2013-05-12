class AddVideoPost < ActiveRecord::Migration
def change
   	add_column :posts, :vid_file_name,    :string
    add_column :posts, :vid_content_type, :string
    add_column :posts, :vid_file_size,    :integer
    add_column :posts, :vid_updated_at,   :datetime
end
end
