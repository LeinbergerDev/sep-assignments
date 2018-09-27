include RSpec

require_relative 'min_heap'
require_relative 'node'

RSpec.describe Minheap, type: Class do
    let (:root) { Node.new("The Matrix", 87) }

    let (:tree) { Minheap.new(root) }
    let (:pacific_rim) { Node.new("Pacific Rim", 72) }
    let (:braveheart) { Node.new("Braveheart", 78) }
    let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
    let (:donnie) { Node.new("Donnie Darko", 85) }
    let (:inception) { Node.new("Inception", 86) }
    let (:district) { Node.new("District 9", 90) }
    let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
    let (:martian) { Node.new("The Martian", 92) }
    let (:hope) { Node.new("Star Wars: A New Hope", 93) }
    let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
    let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

      describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(root, pacific_rim)
      expect(root.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      expect(root.left.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      expect(root.left.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, district)
      expect(root.right.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, hope)
      tree.insert(root, martian)
      expect(root.right.left.title).to eq "The Martian"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end
  end

end