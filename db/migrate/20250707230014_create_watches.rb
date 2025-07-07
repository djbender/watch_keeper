class CreateWatches < ActiveRecord::Migration[8.0]
  def change
    create_table :watches do |t|
      t.string :name

      t.timestamps
    end
  end
end
