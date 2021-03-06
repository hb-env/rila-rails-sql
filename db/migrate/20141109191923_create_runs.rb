class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :name
      t.integer :min_age
      t.integer :max_age
      t.boolean :relay

      t.timestamps
    end
  end
end
