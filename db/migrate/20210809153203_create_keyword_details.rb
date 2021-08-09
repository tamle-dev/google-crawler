class CreateKeywordDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :keyword_details do |t|
      t.text :title
      t.text :description
      t.text :url
      t.string :domain
      t.integer :position
      t.integer :keyword_id

      t.timestamps
    end

    add_index :keyword_details, :keyword_id
  end
end
