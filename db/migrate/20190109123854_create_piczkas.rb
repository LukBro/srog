class CreatePiczkas < ActiveRecord::Migration[5.2]
  def change
    create_table :piczkas, &:timestamps
  end
end
