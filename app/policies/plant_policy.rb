class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    user.admin? || record.user == user
  end

  def edit?
    user.admin? || record.user == user
  end

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end
end
