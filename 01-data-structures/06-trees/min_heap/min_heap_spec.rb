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
        it "properly inserts a new node as a left child " do
            tree.insert(district)
            expect(tree.root.left.title).to eq "District 9"
        end

        it "properly inserts a new node into the right leaf" do
            tree.insert(district)
            tree.insert(martian)
            expect(tree.root.right.title).to eq "The Martian"
        end

        it "properly reorders the leaves from left to right" do
            tree.insert(martian)
            tree.insert(district)
            expect(tree.root.left.title).to eq "District 9"
            expect(tree.root.right.title).to eq "The Martian"
        end

        it "properly swaps root when data.rating is smaller" do
            tree.insert(braveheart)
            expect(tree.root.title).to eq "Braveheart"
        end

        it "properly inserts a node into the third layer" do
            tree.insert(district)
            tree.insert(martian)
            tree.insert(hope)
            expect(tree.root.left.left.title).to eq "Star Wars: A New Hope"
        end

        #  it "properly inserts a node into the third layer" do
        #     tree.insert(district)
        #     tree.insert(martian)
        #     tree.insert(hope)
        #     tree.insert(empire)
        #     expect(tree.root.left.left.title).to eq "Star Wars: A New Hope"
        #     expect(tree.root.left.right.title).to eq "Star Wars: The Empire Strikes Back"
        # end

        # it "properly inserts a node into the third layer" do
        #     tree.insert(district)
        #     tree.insert(martian)
        #     tree.insert(hope)
        #     tree.insert(empire)
        #     tree.insert(mad_max_2)
        #     expect(tree.root.left.left.title).to eq "Star Wars: A New Hope"
        #     expect(tree.root.left.right.title).to eq "Star Wars: The Empire Strikes Back"
        #     expect(tree.root.right.left.title).to eq "Mad Max 2: The Road Warrior"
        # end

        # it "inserts nodes from left to right" do
        #     tree.insert(root, district)
        #     tree.insert(root, martian)
        #     expect(tree.root.left.title).to eq "District 9"
        #     expect(tree.root.right.title).to eq "The Martian"
        # end

        # it "replaces the root if the rating is lower" do
        #     tree.insert(root, pacific_rim)
        #     expect(tree.root.left.title).to eq "The Matrix"
        # end

        # it "inserts nodes from left to right" do
        #     tree.insert(root, district)
        #     tree.insert(root, pacific_rim)
        #     expect(tree.root.title).to eq "Pacific Rim"
        #     expect(tree.root.left.title).to eq "The Matrix"
        #     expect(tree.root.right.title).to eq "District 9"
        # end
    end

    # describe "#find(data)" do

    #     it "returns nil when data is nil" do
    #         expect(tree.find(tree.root, nil)).to eq nil
    #     end

    #     it "finds the root node correctly" do
    #         expect(tree.find(tree.root, tree.root.title).title ).to eq "The Matrix"
    #     end

    #     it "finds the correct node when it exists" do
    #         tree.insert(root, district)
    #         expect(tree.find(root, district.title).title ).to eq "District 9"
    #     end
    # end

    # describe "#printf" do
    #     specify {
    #         expected_output = "The Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98"
    #         tree = Minheap.new(root)
    #         tree.insert(root, district)
    #         tree.insert(root, shawshank)
    #         tree.insert(root, martian)
    #         tree.insert(root, hope)
    #         tree.insert(root, empire)
    #         tree.insert(root, mad_max_2)
    #         expect { tree.printf }.to output(expected_output).to_stdout
    #     }
        
    # end
    
end