class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    add_index :tags, :name

    create_table :taggings do |t|
      t.references :reaction
      t.references :tag
      t.timestamps
    end

    add_index :taggings, :reaction_id
    add_index :taggings, :tag_id
  end
end
