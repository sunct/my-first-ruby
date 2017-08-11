class CreateMyblogs < ActiveRecord::Migration[5.0]
  def change
    create_table :myblogs do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.text :abstract
      t.text :content

      t.timestamps
    end
    add_index :myblogs, [:user_id, :created_at]
  end
end
