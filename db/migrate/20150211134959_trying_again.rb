class TryingAgain < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.integer :wins
      t.integer :losses
    end
  end
end
