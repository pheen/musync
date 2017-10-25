class CreateGroups < ActiveRecord::Migration[5.1]
  def up
    create_table :groups do |t|
      t.string 'url', null: false
      t.integer 'index'
      t.integer 'position'
      t.integer 'owner_id'
    end
  end

  def down
  	drop_table :groups
  end
end
