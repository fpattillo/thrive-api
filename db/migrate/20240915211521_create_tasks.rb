class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.references :period, null: false, foreign_key: true
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
