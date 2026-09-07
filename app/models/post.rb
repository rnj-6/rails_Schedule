class Post < ApplicationRecord
  validates :title,
      presence: true,
      length: { maximum: 20 }

  validates :start_date, presence: true

  validates :end_date,
      presence: true

  validate :dates_are_valid
  def dates_are_valid
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:end_date, "は開始日以降の日付を選択してください")
    end
  end

  validates :body, length: { maximum: 500 }
end
