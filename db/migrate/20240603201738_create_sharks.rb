class CreateSharks < ActiveRecord::Migration[7.2]
  def change
    create_table :sharks do |t|
      t.string :name
      t.text :facts

      t.timestamps
    end
  end
end
