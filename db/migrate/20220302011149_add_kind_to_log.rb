class AddKindToLog < ActiveRecord::Migration[6.1]
  def change
    add_column :logs, :kind, :integer, default: 0, null: false
    add_index :logs, :kind
  end
end
