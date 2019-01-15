class AddPaswordDigestToSigns < ActiveRecord::Migration[5.2]
  def change
    add_column :signs, :password_digest, :string
    add_column :signs, :string, :string
  end
end
