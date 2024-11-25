class Task < ApplicationRecord
  belongs_to :period
  has_many :tags
  has_many :subtasks, dependent: :destroy

  validates :variant, presence: true
  validates :progress, numericality: { less_than_or_equal_to: :goal }
  validates :goal, presence: true
end
