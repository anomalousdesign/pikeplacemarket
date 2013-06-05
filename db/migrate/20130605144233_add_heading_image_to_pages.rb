class AddHeadingImageToPages < ActiveRecord::Migration
  def change
    add_column :pages, :heading_image, :string
    add_column :pages, :spotlight, :string
  end
end
