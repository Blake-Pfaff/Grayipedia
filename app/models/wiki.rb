class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :collabotator
  has_many :users, through: :collaborations

  def public?
    !self.private?
  end
end

