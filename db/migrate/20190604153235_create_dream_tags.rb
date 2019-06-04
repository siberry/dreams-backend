class CreateDreamTags < ActiveRecord::Migration[5.2]
  def change
    create_table :dream_tags do |t|
      t.string :tag_name
      t.string :interpretation
      t.string :source

      t.timestamps
    end
  end
end
