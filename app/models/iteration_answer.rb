# frozen_string_literal: true

class IterationAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :iteration
  belongs_to :question
end
