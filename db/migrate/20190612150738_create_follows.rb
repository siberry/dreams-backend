class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :followed_id, foreign_key: true

      t.timestamps
    end
  end
end
