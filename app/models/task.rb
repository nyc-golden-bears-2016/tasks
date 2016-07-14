class Task < ActiveRecord::Base
  validates :description, presence: true

  def toggle_completeness
    self.toggle!(:completed)
  end
end
