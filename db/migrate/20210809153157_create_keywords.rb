class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :value
      t.integer :total_adword
      t.integer :total_url
      t.integer :total_result
      t.integer :total_result_time
      t.text :page_resource
      t.integer :attachment_id

      t.timestamps
    end
    
    add_index :keywords, :value
    add_index :keywords, :attachment_id
  end
end
