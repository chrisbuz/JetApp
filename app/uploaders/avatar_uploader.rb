# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  def default_url(*args)
    [version_name, "default.jpg"].compact.join('_')
  end

  # Choose what kind of storage to use for this uploader:
  # USED FOR LOCAL STORAGE (DELETES EACH PUSH)
  storage :file

  # UNCOMMENT IF YOU WANT TO UPLOAD TO AWS (NEED AWS KEYS ON LOCAL MACHINE)
  # storage :fog
  
  # For Cache location
  def cache_dir
    "/tmp/your-folder-cache"
  end
   
  # Only allows jpg, jpeg, or png
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [50, 50]
  end
  version :small do 
    process :resize_to_fit => [150,150]
  end
  
  version :medium do 
    process :resize_to_fit => [300,300]
  end

  version :large do 
    process :resize_to_fit => [600,600]
  end


  # version :medium do
  #     process :resize_to_fit => [300, 300]
  # end 

  # version :small do
  #     process :resize_to_fit => [140, 140]
  # end 

  # version :thumb do
  #   process resize_to_fill: [64,64]
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
