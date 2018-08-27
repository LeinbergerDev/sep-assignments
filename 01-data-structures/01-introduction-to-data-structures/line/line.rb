# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person)
  end

  def leave(person)
    index = self.members.index(person)
    if index != nil
      self.members.delete_at(index)
    end
  end

  def front
    self.members.first()
  end

  def middle
    middleIndex = (self.members.length / 2).to_int
    self.members[middleIndex]
  end

  def back
    self.members.last();
  end

  def search(person)
    if index(person)
      return self.members[index(person)]
    else
      return nil
    end
  end

  private

  def index(person)
    index = self.members.index(person)
    if index != nil
      return index
    else
      return nil
    end
  end

end