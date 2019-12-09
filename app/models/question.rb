# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  after_initialize :init

  has_many :answers, dependent: :destroy

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

  delegate :count, to: :question, prefix: true
end
