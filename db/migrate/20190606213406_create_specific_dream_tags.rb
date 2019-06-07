class CreateSpecificDreamTags < ActiveRecord::Migration[5.2]
  def change
    create_table :specific_dream_tags do |t|
      t.belongs_to :dream, foreign_key: true
      t.references :dream_tag, foreign_key: true

      t.timestamps
    end
  end
end
