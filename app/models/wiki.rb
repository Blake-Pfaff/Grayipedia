class Wiki < ApplicationRecord
  belongs_to :user, optional: true

  # lets you filter public wikis
  def self.public_wikis
    where(private: false)
  end
end
