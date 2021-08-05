class CreateOpenrecs < ActiveRecord::Migration[5.2]
  def change
    create_table :openrecs do |t|
      t.string :openrec_url
      t.text :body
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
