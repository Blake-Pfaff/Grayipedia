class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :collaborators
  has_many :users, through: :collaborators

  # lets you filter public wikis
  def public?
    !private?
  end
end
