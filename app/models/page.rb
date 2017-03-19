# frozen_string_literal: true

class Page < ApplicationRecord
  enum state: [:fresh, :parsed]

  has_many :headers
  has_many :links

  validates :url, presence: true

  after_create :parse_data

  def as_json(options = nil)
    super({ include: [:links, :headers] }.merge(options || {}))
  end

  private

  def parse_data
    PageJob.perform_later(self)
  end
end
