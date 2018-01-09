class User < ApplicationRecord
  has_many :wikis
  has_many :coloborators
  has_many :shared_wikis, through: :collaborations, source: :wiki

  after_initialize :init
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: %i[standard premium admin]

  def init
    self.role ||= 0 # will set the default value only if it's nil
  end
end
