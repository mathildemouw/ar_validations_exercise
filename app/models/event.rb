class Event < ActiveRecord::Base
  validate :date_must_be_valid
  validates :date, presence: true, format: {with: /....\-..\-../}
  validates :title, presence: true, uniqueness: true
  validates :organizer_name, presence: true
  validates :organizer_email, format: {with: /.+@.+\..+/}

  def date_must_be_valid
    if date < Date.today
      errors.add(:date, "cannot be in the past")
    end
  end

end
