class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      user.admin? ? scope.all : scope.where(user: user)
    end

    def index?
      return true
    end

    def new?
      return true
    end

    def create?
      return true
    end
  end
end
