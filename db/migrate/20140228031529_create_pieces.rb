class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :composer
      t.string :author
      t.date :date
      t.string :opus
      t.string :pages
      t.string :positionInCycle
      t.text :imageURLs
      t.text :originalText
      t.text :transliterationText
      t.text :translationText

      t.timestamps
    end
  end
end
