class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :age
      t.boolean :sex
      t.text :profile

      t.timestamps
    end
  end
end
