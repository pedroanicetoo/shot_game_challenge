class CreateMatch < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :log_ids, array: true, default: []

      t.timestamps
    end
  end
end
