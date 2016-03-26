class Song < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :artist

  def self.order_songs
    order(title: :asc)
  end
end
