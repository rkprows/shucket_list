require 'rails_helper'

RSpec.describe List, type: :model do
  	
	describe 'attributes' do

		it { should respond_to :title }
		it { should respond_to :description }
		it { should respond_to :category }

		# it 'has a title' do
		# 	title = 'Weekend Fun'
		# 	list = List.create(title: title)
		# 	expect(list.title).to eq(title)
		# end
	end

	 # test methods
	describe 'class methods' do
 		before(:each) do
 			@list1 = List.create(title: 'Road Trip', description: 'Places to see on our drive', category: 'Travel')
 			@list2 = List.create(title: 'Housecleaning', description: '2016 To-Do', category: 'Lifestyle')
 			@list3 = List.create(title: 'Shopping List', description: 'Focus', category: 'Commerce')
 		end

 		it 'sorts by title' do 
 			lists = List.by_title
 			expect(lists).to eq([@list2, @list1, @list3])
 		end

		it 'sorts by category' do 
 			lists = List.by_category
 			expect(lists).to eq([@list3, @list2, @list1])
 		end

 		it 'sorts by description asc' do 
 			lists = List.by_description
 			expect(lists).to eq([@list2, @list3, @list1])
 		end

		it 'sorts by description desc' do 
 			lists = List.by_description(true)
 			expect(lists).to eq([@list1, @list3, @list2])
 		end

	end

	describe 'instance methods' do
		before(:each) do
 			@list = List.create(title: 'Weekend Fun', description: 'Memorial Day 2016', category: 'Bank Holiday')
 		end

		it 'marks the occasion' do
			@list.occasion('Hitzefrei')
			expect(@list.category).to eq('Hitzefrei')
		end

	end
end