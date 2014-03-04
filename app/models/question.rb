class Question < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :answers, dependent: :destroy

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_many :likes, as: :likable
  has_many :likers, through: :likes, source: :user

  validates_presence_of :title, message: "must have something"
  validates_presence_of :body
  validates_numericality_of :like_counter, allow_nil: true
  validates :title, presence: true, uniqueness: true, length: {minimum: 10}

  scope :ten,     -> { limit(10) }
  scope :recent,  -> { where(["updated_at > ?", Time.now - 10.day]) }
  scope :all_but, lambda {|ids| where(["id NOT IN (?)", ids])}

  before_save :capitalize_title, on: :create
  before_save :print1
  after_save :print2

  default_scope { order("updated_at DESC") }


  # def to_param
  #   "#{id} #{title}".parameterize
  # end

  def self.long_titled
    Question.all.select {|q| q.title.length > 30 }
  end

  def self.generate_random_questions(number_of_questions = 100)
    number_of_questions.times do
      random_title = (0...rand(60)).map { ('a'..'z').to_a[rand(26)] }.join
      Question.create(title: random_title, body: "asdfasdfasdf")
    end
  end

  def liked_by? user
    likers.include? user
  end

  def like_by user
    likers << user
    self.like_counter += 1
    save
  end

  def unlike_by user
    likers.delete user
    self.like_counter -= 1
    save
  end

  private

  def capitalize_title
    self.title.capitalize!
  end

  def print1
    Rails.logger.info "Before Save"
  end

  def print2
    Rails.logger.info "After Save"
  end

end