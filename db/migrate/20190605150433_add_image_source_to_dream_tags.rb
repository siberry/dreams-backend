class AddImageSourceToDreamTags < ActiveRecord::Migration[5.2]
  def change
    add_column :dream_tags, :img_source, :string
  end
end
