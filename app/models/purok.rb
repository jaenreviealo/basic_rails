class Purok < ApplicationRecord
  has_many :residents

  def alias
    "#{num} - #{name.titleize}"
  end
end
