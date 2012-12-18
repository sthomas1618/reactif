class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :remarks
      t.integer :reacting_with_id
      t.references :user
      t.references :reaction
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :reaction_id
    add_index :comments, :reacting_with_id
  end

end
