class Answer < ActiveRecord::Base
  belongs_to :question, touch: true
  belongs_to :user


  validates :body, presence: true, length: {minimum: 3}

  has_many :likes, as: :likable
  has_many :likers, through: :likes, source: :user

end