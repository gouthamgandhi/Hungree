class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.text :email

      t.timestamps
    end
  end
end
