class CreateLog < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.text :file_text
      t.date :moment
      t.references :match
      t.references :murder
      t.references :victim
      t.string :death_reason
      t.timestamps
    end
  end
end
