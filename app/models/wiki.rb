class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :collabotator
  has_many :users, through: :collaborations

  # lets you filter public wikis
  def public?
    Wiki.where(private: false)
  end
end
