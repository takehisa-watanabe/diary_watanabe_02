class CreateDiaries < ActiveRecord::Migration[7.2]
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :text
      t.date :date
      t.timestamps
    end
  end
end
