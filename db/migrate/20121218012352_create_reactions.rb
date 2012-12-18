class CreateReactions < ActiveRecord::Migration
  def change
   create_table :reactions do |t|
      t.string  :title
      t.string  :context
      t.integer :views
      t.references :user
      t.timestamps
    end
    add_index :reactions, :user_id
  end
end
