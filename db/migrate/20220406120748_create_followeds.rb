class CreateFolloweds < ActiveRecord::Migration[6.0]
  def change
    create_table :followeds do |t|
      t.integer :user_id
      t.integer :followed
      t.string :username

      t.timestamps
    end
  end
end
