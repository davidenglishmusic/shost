class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.string :pages
      t.text :source
      t.string :author
      t.string :url
      t.date :date

      t.timestamps
    end
  end
end
