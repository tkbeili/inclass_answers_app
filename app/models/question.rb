class Question < ActiveRecord::Base

  before_save :capialize_title


  def capitalize_title
    self.title = title.capitalize
  end
end