class Node
    attr_accessor :name
    attr_accessor :film_actor_hash

    def initialize(name, film_title, actors)
        @name = name
        @film_actor_hash = Hash.new
        @film_actor_hash[film_title] = actors
    end

    def insert(film_title, actors)
        @film_actor_hash[film_titile] = actors
    end
end