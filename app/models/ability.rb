class Ability
    include CanCan::Ability

    def initializer(user)
        user ||= User.new

        # can :create, Job, user_id:user.id
        # can :edit, Job, user_id:user.id
        # can :delete, Job, user_id:user.id
        can :delete, Review, user_id:user.id

        if user.is_admin
            can :manage, :all
        else
            can :manage, :read
        end

        if user.is_recruiter
            can :create, Job, user_id:user.id
            can :edit, Job, user_id:user.id
            can :delete, Job, user_id:user.id
        else
            can :manage, :read
        end
    end
end
