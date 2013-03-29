class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :lang
      t.integer :pos_id
      t.string :register
      t.string :properties
      t.integer :frequency
      t.integer :level
      t.string :phrase_class
      t.string :phrase_text
      t.integer :author_id
      t.integer :editor_id

      t.timestamps
    end
  end
end
