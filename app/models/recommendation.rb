# frozen_string_literal: true

class Recommendation < ApplicationRecord
  has_many :answers, dependent: :nullify
  has_many :iteration_answers, through: :answers
  has_many :iterations, through: :iteration_answers

  validates :title, :description, :identifier, presence: true
  validates :identifier, uniqueness: true

  def description_formatted
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, no_intra_emphasis: true)
    markdown.render(description.to_s)
  end
end
