class Role < ActiveRecord::Base
  belongs_to :users
  before_create :set_priority



  private
  def set_priority
    if @current_user.has_role? :admin
      self.priority = 1
    end
  end
end
