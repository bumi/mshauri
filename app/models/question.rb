# frozen_string_literal: true

class Question < ApplicationRecord
  after_initialize :init

  has_many :answers

  validates :title, presence: true
  validates :description, presence: false

  def init
    self.entry ||= false
  end

  def as_json(args = {})
    super(args.merge(
        methods: %i[answers]
    ))
  end
end
