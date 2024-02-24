class Joke < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :joke_categories
  has_many :categories, through: :joke_categories

  validates :title, presence: true
  validates :joke, presence: true

  before_save :trim_joke
  before_validation :add_title

  def add_title
    self.title = "Joke ##{Joke.maximum(:id).next}" unless self.title.present?
  end

  def display_title
    self.title.present? ? self.title : "Joke ##{self.id}"
  end

  def self.next_id
    maximum(:id)&.next || 1
  end

  def trim_joke
    self.joke.strip!
  end

end
