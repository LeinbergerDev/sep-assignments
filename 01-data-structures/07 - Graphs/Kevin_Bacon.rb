include 'node'

class KevinBacon
    
    def find_kevin_bacon(actor)
        # create a films array.  This will store the arrays that hold a connection between the two actors
        films = []
        # each actor has a hash of movies and actors.
        actor.film_actor_hash.each do |title, actors|
            actors.each do |actor|
                if actor == "Kevin_Bacon"
                    films.push(title)
                else
                    find_kevin_backon(actor)
                end
            end
        end
        if films.length <= 6 && films.length > 0
            puts("#{actor} is connected to Kevin Bacon by these films: #{films.all}")
        else
            puts("#{actor} is not connected to Kevin Bacon in 6 films or lesss")
        end
    end
end