class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories, id: :uuid do |t|
      t.references :member, type: :uuid
      t.integer :platform
      t.string :url, index: { unique: true }
      t.string :short_url
      t.string :user_name
      t.string :user_nickname
      t.integer :followers
      t.integer :following
      t.integer :last_year_contrib
      t.integer :stars
      t.string :avatar
      t.string :organization
      t.string :location

      t.timestamps
    end
  end
end
