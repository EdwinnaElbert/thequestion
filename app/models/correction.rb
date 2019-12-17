class Correction < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  has_one :diff_answer
end
