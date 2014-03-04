class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers

  has_many :likes
  has_many :liked_questions , through: :likes, source: :question

  has_one  :api_key

  before_create :generate_api_key

  def name_display
    if first_name || last_name
      "#{first_name} #{last_name}".strip
    else
      email.gsub /@.*/, ""
    end
  end

  private

  def generate_api_key
    self.api_key = ApiKey.new
  end

end