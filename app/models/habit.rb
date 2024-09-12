class Habit < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user_id, message: "You already have a habit with this name." }

  belongs_to :user
end
