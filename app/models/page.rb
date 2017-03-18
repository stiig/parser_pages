# frozen_string_literal: true

class Page < ApplicationRecord
  enum state: [:fresh, :parsed]

  has_many :headers
  has_many :links
end
