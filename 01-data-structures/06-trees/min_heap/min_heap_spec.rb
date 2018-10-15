include RSpec
require 'benchmark'

require_relative 'min_heap'

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
    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, pacific_rim)
      expect(tree.root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.left.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      expect(tree.root.right.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      expect(tree.root.right.left.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, empire)
      expect(tree.root.right.right.title).to eq "Star Wars: The Empire Strikes Back"
    end
  end

  describe "#find" do
    it "finds the correct node" do
        expect(tree.find(tree.root, "The Matrix").title).to eq "The Matrix"
    end

    it "finds the correct node" do
        tree.insert(tree.root, pacific_rim)
        tree.insert(tree.root, district)
        tree.insert(tree.root, hope)
        expect(tree.find(tree.root, pacific_rim.title).title).to eq pacific_rim.title
        expect(tree.find(tree.root, hope.title).title).to eq hope.title
    end
  end

  describe "#printf" do
     specify {
       expected_output = "The Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(root, district)
       tree.insert(root, shawshank)
       tree.insert(root, martian)
       tree.insert(root, hope)
       tree.insert(root, empire)
       tree.insert(root, mad_max_2)
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end

  describe "#benchmark" do
    index = 1
    node = Node.new("Title #{index.to_s}", index )
    tree = Minheap.new(node)
    Benchmark.bm()
    puts Benchmark.measure {
    10000.times do
      index = index + 1
      node = Node.new("Title #{index.to_s}", index)
      tree.insert(tree.root, node)
    end


  }
  end
end