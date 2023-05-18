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

        can :create, Apply do |apply|
            user.persisted? && apply.user != user.is_recruiter && user_id:user.id
        end
    end
end
