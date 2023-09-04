class Movie < ApplicationRecord
  validates :title, presence: true
  validates :overview, presence: true
  validates :title, uniqueness: true
  validates :overview, uniqueness: true
  has_many :lists, through: :bookmarks
  has_many :bookmarks
end
