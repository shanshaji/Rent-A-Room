class Ability
  include CanCan::Ability

    def initialize(user)
        if user.nil? # if the user is not logged in
            can :read, [Room, City, Amenity, Review]
        elsif user.role? "admin" 
            can :manage, [Room, City, Amenity, Review]
        elsif user.role? "host"
            can :read, [Room, City, Amenity]
            can :create, Room
            can :my_rooms, Room
            can [:update, :destroy], Room do |room| 
                room.user_id == user.id 
            end
            can [:update, :destroy], Review do |review|
                review.user_id == user.id   
            end
            
        elsif user.role? "guest"
            can :read, [Room, City, Amenity]
            can [:create], Room 
            can [:update, :destroy], Review do |review|
                review.user_id == user.id   
            end
        end
    end
end
