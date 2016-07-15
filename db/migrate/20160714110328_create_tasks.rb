class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :completed, default: false
      t.references :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
