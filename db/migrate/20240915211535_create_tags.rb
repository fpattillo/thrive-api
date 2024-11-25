class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.references :task, null: false, foreign_key: true
      t.string :name
      t.string :color_code
      t.boolean :completed

      t.timestamps
    end
  end
end
