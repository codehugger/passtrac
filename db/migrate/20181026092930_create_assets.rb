class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.belongs_to :company, foreign_key: true
      t.string :name
      t.string :key

      t.timestamps
    end
  end
end
