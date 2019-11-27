class Answer < ApplicationRecord
  belongs_to :question
  after_initialize :init

  def init
    self.score ||= 0.0
    self.freetext ||= false
  end

end
