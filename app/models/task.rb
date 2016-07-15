class Task < ActiveRecord::Base
  validates :description, presence: true

  belongs_to :user

  def toggle_completeness
    self.toggle!(:completed)
  end
end
