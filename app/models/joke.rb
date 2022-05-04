class Joke < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  def display_title
    self.title.present? ? self.title : "Joke ##{self.id}"
  end
end
