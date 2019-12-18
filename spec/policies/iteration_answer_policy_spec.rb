# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IterationAnswerPolicy do
  subject { described_class.new(user, iteration_answer_record) }

  let(:resolved_scope) do
    described_class::Scope.new(user, IterationAnswer.all).resolve
  end

  let!(:iteration) { FactoryBot.create(:iteration) }
  let(:iteration_answer_record) { FactoryBot.create(:iteration_answer, iteration: iteration) }

  context 'when being a visitor' do
    let(:user) { nil }

    it 'excludes iteration_answer_record in resolved scope' do
      expect(resolved_scope).not_to include(iteration_answer_record)
    end

    it { is_expected.to forbid_actions(%i[create show update destroy]) }
  end

  context 'when being a user' do
    let(:user) { FactoryBot.create(:user) }

    it 'excludes iteration_record in resolved scope' do
      expect(resolved_scope).not_to include(iteration_answer_record)
    end

    it { is_expected.to forbid_actions(%i[create show update destroy]) }
  end

  context 'when being the user' do
    let(:user) { FactoryBot.create(:user) }
    let!(:iteration) { FactoryBot.create(:iteration, user: user) }

    it 'includes iteration_record in resolved scope' do
      expect(resolved_scope).to include(iteration_answer_record)
    end

    it { is_expected.to forbid_actions(%i[create show update destroy]) }
  end

  context 'when being a admin' do
    let(:user) { FactoryBot.create(:user, admin: true) }

    it 'includes iteration_record in resolved scope' do
      expect(resolved_scope).to include(iteration_answer_record)
    end

    it { is_expected.to forbid_actions(%i[create show update destroy]) }
  end
end
