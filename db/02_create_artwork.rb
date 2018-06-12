class CreateArtwork < ActiveRecord::Migration[5.0]
    def change
        create_table :artwork do |a|
            a.string :art
            a.integer :user_id
            end
        end
    end
