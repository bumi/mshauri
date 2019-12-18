# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecommendationPolicy do
  subject { described_class.new(user, recommendation_record) }

  let(:resolved_scope) do
    described_class::Scope.new(user, Recommendation.all).resolve
  end

  let(:recommendation_record) { FactoryBot.create(:recommendation) }

  context 'when being a visitor' do
    let(:user) { nil }

    it 'excludes recommendation_record in resolved scope' do
      expect(resolved_scope).not_to include(recommendation_record)
    end
  end

  context 'when being a user' do
    let(:user) { FactoryBot.create(:user) }
    let!(:iteration) { FactoryBot.create(:iteration) }
    let!(:answer) { FactoryBot.create(:answer) }
    let!(:iteration_answer) { FactoryBot.create(:iteration_answer, iteration: iteration, answer: answer) }
    let(:recommendation_record) { FactoryBot.create(:recommendation, answers: [answer]) }

    it 'excludes recommendation_record in resolved scope' do
      expect(resolved_scope).not_to include(recommendation_record)
    end
  end

  context 'when being the user' do
    let(:user) { FactoryBot.create(:user) }
    let!(:iteration) { FactoryBot.create(:iteration, user: user) }
    let!(:answer) { FactoryBot.create(:answer) }
    let!(:iteration_answer) { FactoryBot.create(:iteration_answer, iteration: iteration, answer: answer) }
    let(:recommendation_record) { FactoryBot.create(:recommendation, answers: [answer]) }

    it 'includes recommendation_record in resolved scope' do
      expect(resolved_scope).to include(recommendation_record)
    end
  end

  context 'when being a admin' do
    let(:user) { FactoryBot.create(:user, admin: true) }

    it 'includes recommendation_record in resolved scope' do
      expect(resolved_scope).to include(recommendation_record)
    end
  end
end
