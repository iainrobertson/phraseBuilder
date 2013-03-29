class CreatePos < ActiveRecord::Migration
  def change
    create_table :pos do |t|
      t.string :pos_detail
      t.string :pos_class

      t.timestamps
    end
  end
end
