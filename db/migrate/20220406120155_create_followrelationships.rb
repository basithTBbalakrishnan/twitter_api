class CreateFollowrelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :followrelationships do |t|
      t.integer :user_id
      t.integer :followed

      t.timestamps
    end
  end
end
