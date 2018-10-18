include RSpec

require_relative 'Kevin_Bacon'

RSpec.describe KevinBacon, type: Class do
       let(:kevin_bacon) { KevinBacon.new }
       let(:chris_penn) { Node.new('Chris_Penn', 'Footloose', ['Lori_Singer', 'John_Lithgow', 'Dianne_Wiest', 'Kevin_Bacon'])}
       let(:john_lithgow) { Node.new('John_Lithgow', 'Footloose', ['chris_penn', 'Dianne_Wiest', 'Kevin_Bacon'] ) }
       let(:shirley_maclaine) { Node.new('Shirley_MacLaine', 'Terms_of_Endearment', [ john_lithgow ])}

       describe 'kevin bacon hash' do
            it "has a hash with key Kevin_Bacon" do
                expect(kevin_bacon.kevin_bacon_hash).to_not be_nil
            end

            it "has a value for title footloose" do
                expect(kevin_bacon.kevin_bacon_hash.film_actor_hash['Footloose']).to_not be_nil
            end
       end

       describe 'GET Kevin Bacon' do
            it "finds a connection between chris penn and kevin bacon" do
                expect(kevin_bacon.find_kevin_bacon(chris_penn)).to eq 'Chris_Penn is connected to Kevin Bacon by these films: ["Footloose"]'
            end

            it "finds a connection between Shirley MacLaine and Kevin Bacon" do
                expect(kevin_bacon.find_kevin_bacon(shirley_maclaine)).to eq 'Shirley_MacLaine is connected to Kevin Bacon by these films: ["Terms_of_Endearment", "Footloose"]'
            end
       end
end
