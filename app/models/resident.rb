class Resident < ApplicationRecord
  belongs_to :purok

  def full_name
    last_name + ", " + first_name + " " + middle_name
  end
end
