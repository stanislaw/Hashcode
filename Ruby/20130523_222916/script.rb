gem 'rails', '>=3.1.0'
gem 'paperclip'

require 'active_record'
require 'paperclip'

# Print out what version we're running
puts "Active Record #{ActiveRecord::VERSION::STRING}"

# Connect to an in-memory sqlite3 database (more on this in a moment)
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => ':memory:'
)

# Create the minimal database schema necessary to reproduce the bug
ActiveRecord::Schema.define do
  create_table :products, :force => true do |t|
  end

  create_table :uploads, :force => true do |t|
    t.belongs_to :product

    t.string :upload_file_name
    t.integer :upload_file_size
    t.string :upload_content_type
    t.datetime :upload_updated_at
  end
end

class ActiveRecord::Base
  include Paperclip::Glue
end

# Create the minimal set of models to reproduce the bug
class Product < ActiveRecord::Base
  has_one :upload
end

class Upload < ActiveRecord::Base
  belongs_to :product

  has_attached_file :upload, :path => ":id/:style/:basename.:extension"
end

# Create some test data
#
# If you're demonstrating an exception, then this is probably not necessary,
# but if your bug is to do with the wrong data being returned from the database,
# then you'll probably need some test data to show that.

product = Product.create
upload = Upload.new

image = File.open("image.jpg")
puts image.inspect

upload.upload = image

product.upload = upload
product.save

product = Product.find(1)
puts product.inspect
puts product.upload.inspect
