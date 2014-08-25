# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "development/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fit: [50, 50]
  end

  version :banner do
    process resize_to_limit: [800, 200]
  end

  version :small_banner, from_version: :banner do
    process resize_to_limit: [400, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
