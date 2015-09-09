class CreateWines < ActiveRecord::Migration
  def change
    create_table(:wines) do |t|
      t.column(:name, :string)
      t.column(:country, :string)
      t.column(:price, :string)
      t.column(:rate, :string)

      t.timestamps()
    end
  end
end