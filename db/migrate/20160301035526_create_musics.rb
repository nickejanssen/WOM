class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
