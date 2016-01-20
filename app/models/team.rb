class Team < ActiveRecord::Base
  has_many :documents
  has_and_belongs_to_many :clients





  def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{search}%")
  end

end
