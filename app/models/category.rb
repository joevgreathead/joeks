class Category < ApplicationRecord
  has_many :joke_categories, dependent: :destroy
  has_many :jokes, through: :joke_categories

  before_create :add_color
  after_initialize :add_color

  def add_color
    self.color = "#" + ("%06x" % (rand * 0xffffff)) if self.color.blank?
  end
end
