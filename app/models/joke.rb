class Joke < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :joke_categories
  has_many :categories, through: :joke_categories

  before_save :trim_joke

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
