class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(published: true).or(scope.where(user_id @user.try(:id)))
    end
  end
end
