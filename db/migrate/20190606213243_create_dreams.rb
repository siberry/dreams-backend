class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.string :date
      t.integer :hours_slept
      t.string :quality
      t.string :state_of_mind
      t.string :inspiration
      t.string :image_url
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
