class CreateSongnotes < ActiveRecord::Migration[4.2]
  def change
    create_table :songnotes do |t|
      t.string :songtitle
      t.string :page
      t.string :xcoordinate
      t.string :ycoordinate
      t.string :measure
      t.text :note

      t.timestamps
    end
  end
end
