class AddPaperclipFieldsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :image_file_name, :string
    add_column :books, :image_content_type, :string
    add_column :books, :image_file_size, :integer
    add_column :books, :image_updated_at, :datetime
  end
end
