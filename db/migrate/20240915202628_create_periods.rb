class CreatePeriods < ActiveRecord::Migration[7.2]
  def change
    create_table :periods do |t|
      t.string :name
      t.integer :duration
      t.integer :completion

      t.timestamps
    end
  end
end
