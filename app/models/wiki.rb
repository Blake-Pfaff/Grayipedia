class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :collaborators
  has_many :users, through: :collaborations

  # lets you filter public wikis
  def public?
      !self.private?
  end
end
