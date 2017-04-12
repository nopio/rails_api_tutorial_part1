class BookCopyPolicy < ApplicationPolicy
  class Scope
    attr_reader :user_context, :scope, :user, :admin

    def initialize(user_context, scope)
      @user_context = user_context
      @admin = user_context.admin
      @user = user_context.user
      @scope = scope
    end

    def resolve
      if admin
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def return_book?
    admin || record.user == user
  end
end
