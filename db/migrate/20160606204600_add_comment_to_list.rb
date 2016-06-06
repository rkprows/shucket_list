class AddCommentToList < ActiveRecord::Migration
  def change  	
  	add_column :lists, :comment_id, :integer
  end
end
