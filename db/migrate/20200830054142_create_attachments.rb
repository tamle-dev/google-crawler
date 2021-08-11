class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :user_id
      t.integer :status

      t.timestamps
    end

    add_index :attachments, :user_id
  end
end
