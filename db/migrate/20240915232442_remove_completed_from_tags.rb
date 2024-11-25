class RemoveCompletedFromTags < ActiveRecord::Migration[7.2]
  def change
    remove_column :tags, :completed, :boolean
  end
end
