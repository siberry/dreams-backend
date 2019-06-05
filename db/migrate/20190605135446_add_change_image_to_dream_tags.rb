class AddChangeImageToDreamTags < ActiveRecord::Migration[5.2]
  def change
    add_column :dream_tags, :change_image, :boolean
  end
end
