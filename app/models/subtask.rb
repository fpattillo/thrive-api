class Subtask < ApplicationRecord
  belongs_to :task

  validate :task_variant_must_be_checklist

  private

  def task_variant_must_be_checklist
    if task.variant != 'checklist'
      errors.add(:task, "must have variant 'checklist' to have subtasks")
    end
  end
end
