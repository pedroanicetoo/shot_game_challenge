class CreatePlayer < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :nick

      t.timestamps
    end
  end
end
