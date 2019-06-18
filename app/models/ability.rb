class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.present?
      can :manage, :all if user.role.super_admin
      can [:read,:update], Story if user.role.name == "writer"
      #can :update, Story do |story|
        #story.writer.id == user.id && (story.status == 'draft' || story.status == 'pending') ||
        #story.reviewer.id == user.id && (story.status == 'for review' || story.status == 'in review')
      #end

    end

  end
end