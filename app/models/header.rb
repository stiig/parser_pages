# frozen_string_literal: true

class Header < ApplicationRecord
  enum header_type: [:h1, :h2, :h3]
  belongs_to :page
end
