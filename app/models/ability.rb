class Ability
  include CanCan::Ability

    def initialize(user)
        if user.nil? # if the user is not logged in
            can :read, [Room, City, Amenity]
        elsif user.role? "admin" 
            can :manage, [Room, City, Amenity]
        elsif user.role? "host"
            can :read, [Room, City, Amenity]
            can :create, Room
            can [:update, :destroy], Room do |room| 
                room.user_id == user.id 
            end
        elsif user.role? "guest"
            can :read, [Room, City, Amenity]
            can [:create], Room 
        end
    end
end
