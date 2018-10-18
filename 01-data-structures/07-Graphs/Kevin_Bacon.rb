require_relative 'node'

class KevinBacon
    attr_accessor :kevin_bacon_hash
    attr_accessor :connection_access
    attr_accessor :films
    
    def initialize
        @kevin_bacon_hash = Node.new('Kevin_Bacon', 'Footloose', [ 'Lori_Singer', 'John_lithgow', 'Dianne_Wiest', 'Chris_Penn'])
    end
    
    
    def find_kevin_bacon(actor)
        if self.connection_access == nil
            self.connection_access = actor.name.to_s
        end
        if self.films == nil
            self.films = Array.new
        end
        # create a films array.  This will store the arrays that hold a connection between the two actors
        # check if the actor array contains kevin_bacon        
        actor.film_actor_hash.each do |title, actors|
            if actors.include? 'Kevin_Bacon'
                self.films.push(title.to_str)
                if films.length <= 6 && films.length > 0
                    puts("#{self.connection_access} is connected to Kevin Bacon by these films: #{@films}")
                    return "#{self.connection_access} is connected to Kevin Bacon by these films: #{@films}"
                else
                    return "#{self.connection_access} is not connected to Kevin Bacon in 6 films or lesss"
                end
            else
                self.films.push(title.to_s)
                actors.each do |actor|
                    find_kevin_bacon(actor)
                end
                if films.length <= 6 && films.length > 0
                    puts("#{self.connection_access} is connected to Kevin Bacon by these films: #{@films}")
                    return "#{self.connection_access} is connected to Kevin Bacon by these films: #{@films}"
                else
                    return "#{self.connection_access} is not connected to Kevin Bacon in 6 films or lesss"
                end
            end
        end
    end

end