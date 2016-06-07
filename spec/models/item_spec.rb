require 'rails_helper'

RSpec.describe Item, type: :model do

	describe 'attributes' do

	it { should respond_to :name }
	it { should respond_to :description }
	it { should respond_to :complete }

	# it 'has a name' do
	# 	name = 'Buy Bread'
	# 	item = Item.create(name: name)
	# 	expect(item.name).to eq(name)
	# end
	end

 # test methods
	describe 'class methods' do
 		before(:each) do
 			@item1 = Item.create(name: 'Vegas', description: 'Hit the tables', complete: false)
 			@item2 = Item.create(name: 'Los Angeles', description: 'Hollywood sign', complete: true)
 			@item3 = Item.create(name: 'Seattle', description: 'Coffee from Starbucks', complete: true)
 		end

 		it 'sorts by name' do 
 			items = Item.by_name
 			expect(items).to eq([@item2, @item3, @item1])
 		end

		it 'sorts by description asc' do 
 			items = Item.by_description
 			expect(items).to eq([@item3, @item1, @item2])
 		end

 		it 'sorts by description desc' do 
 			items = Item.by_description(true)
 			expect(items).to eq([@item2, @item1, @item3])
 		end

	end

	describe 'instance methods' do
		before(:each) do
 			@item = Item.create(name: 'Denver', description: 'Mile High City', complete: false)
 		end

		it 'checks the box' do
			@item.checklist(true)
			expect(@item.complete).to eq(true)
		end

	end
end