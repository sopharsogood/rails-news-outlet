class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :theme, default: 'light'
      t.string :comment_depth
      t.string :bio

      t.timestamps
    end
  end
end
