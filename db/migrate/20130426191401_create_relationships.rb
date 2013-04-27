class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :adder_id
      t.integer :friend_id
      t.boolean :accept, default: false

      t.timestamps
    end
    add_index :relationships, :adder_id
    add_index :relationships, :friend_id
    add_index :relationships, [:adder_id, :friend_id], unique: true
  end
end
