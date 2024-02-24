class Category < ApplicationRecord
  has_many :joke_categories, dependent: :destroy
  has_many :jokes, through: :joke_categories

  after_initialize :add_color

  validates :title, presence: true
  validates :color, presence: true
  validates :color, format: { with: /#\w{6}/, message: "must be in format #A1B2C3" }
  validates :title, uniqueness: true

  def add_color
    self.color = "#" + ("%06x" % (rand * 0xffffff)) if self.color.blank?
  end
end
