class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :value
      t.integer :total_adword
      t.integer :total_url
      t.integer :total_result
      t.integer :total_result_time
      t.integer :keyword_attachment_id
      t.integer :html_attachment_id

      t.timestamps
    end
    
    add_index :keywords, :value
    add_index :keywords, :keyword_attachment_id
    add_index :keywords, :html_attachment_id
  end
end
