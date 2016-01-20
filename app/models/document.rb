class Document < ActiveRecord::Base
  belongs_to :team
  has_and_belongs_to_many :clients

  validates :title,presence: true



  def uploadfile(upload)
    name =  upload.original_filename
    directory = "#{Rails.root}/public/data/"
    path = File.join(directory, name)
    self.file_name = path
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

  def imageupload(upload)
    name =  upload.original_filename
    directory = "#{Rails.root}/public/image/"
    path = File.join(directory, name)
    self.fileimg_path = path

    File.open(path, "wb") { |f| f.write(upload.read) }
  end





  def self.search(search)
    # where(:title, search) -> This would return an exact match of the query
    where("author like ?", "%#{search}%")
  end










end
