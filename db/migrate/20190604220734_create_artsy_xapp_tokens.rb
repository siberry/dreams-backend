class CreateArtsyXappTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :artsy_xapp_tokens do |t|
      t.string :token
      t.string :expires_at

      t.timestamps
    end
  end
end
