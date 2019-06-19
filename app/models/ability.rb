class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.present?
      can :manage, :all if user.role.super_admin
      can [:read,:update], Story if user.role.name == "writer"
      #can :update, Story do |story|
        #story.writer_id == user.id && (story.status.name == 'draft' || story.status.name == 'pending') ||
        #story.reviewer_id == user.id && (story.status.name == 'for review' || story.status.name == 'in review')
      #end

    end

  end
end