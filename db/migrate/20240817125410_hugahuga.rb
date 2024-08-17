class Hugahuga < ActiveRecord::Migration[7.2]
  def change
    add_column :diaries, :writtenbyname, :string, null: true, default: nil
  end
end
