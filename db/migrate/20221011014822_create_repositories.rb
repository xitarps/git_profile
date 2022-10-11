class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories, id: :uuid do |t|
      t.references :member, type: :uuid
      t.integer :platform, default: 0, null: false
      t.string :url
      t.string :short_url
      t.string :user_name
      t.string :user_nickname
      t.string :followers
      t.string :following
      t.string :last_year_contrib
      t.string :stars
      t.string :avatar
      t.string :organization
      t.string :location

      t.timestamps
    end
  end
end
