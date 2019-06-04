class CreatePostPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :post_photos do |t|
      t.string :data
      t.references :photo, foreign_key: true

      t.timestamps
    end
  end
end
