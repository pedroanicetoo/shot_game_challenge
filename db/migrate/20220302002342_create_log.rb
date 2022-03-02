class CreateLog < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.text :file_text
      t.date :moment
      t.integer :match_id
      t.integer :murder_id
      t.integer :victim_id
      t.string :death_reason
      t.timestamps
    end
  end
end
