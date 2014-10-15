class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.datetime :birth_date

      t.timestamps
    end
  end
end
