class Joke < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  has_many :joke_categories
  has_many :categories, through: :joke_categories

  def display_title
    self.title.present? ? self.title : "Joke ##{self.id}"
  end
end
