class Hogehoge < ActiveRecord::Migration[7.2]
  def change
    add_reference :diaries, :person, null:true, foreign_key: true
  end
end
