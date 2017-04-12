class ApplicationPolicy
  attr_reader :user_context, :record, :admin, :user

  def initialize(user_context, record)
    @user_context = user_context
    @record = record
    @admin = user_context.admin
    @user = user_context.user
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user_context, :scope, :user, :admin

    def initialize(user_context, scope)
      @user_context = user_context
      @scope = scope
      @admin = user_context.admin
      @user = user_context.user
    end

    def resolve
      scope
    end
  end
end
