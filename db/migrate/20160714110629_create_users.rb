class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true
      t.string :first_name
      t.string :last_name

      # t.string :how_do_we_do_the_password?

      t.timestamps
    end
  end
end
