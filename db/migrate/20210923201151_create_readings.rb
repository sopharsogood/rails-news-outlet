class CreateReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :readings do |t|
      t.integer :reader_id
      t.integer :read_article_id

      t.timestamps
    end
  end
end
