class AddListToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :list_id, :integer
  end
end
