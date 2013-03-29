class AddIndexToPhrasesPosId < ActiveRecord::Migration
  def change
    add_index :phrases, [:author_id, :created_at]
    add_index :phrases, :pos_id
  end
end
