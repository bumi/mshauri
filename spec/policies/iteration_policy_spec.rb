# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IterationPolicy do
  subject { described_class.new(user, iteration_record) }

  let(:resolved_scope) do
    described_class::Scope.new(user, Iteration.all).resolve
  end

  let(:iteration_record) { FactoryBot.create(:iteration) }

  context 'when being a visitor' do
    let(:user) { nil }

    it 'excludes iteration_record in resolved scope' do
      expect(resolved_scope).not_to include(iteration_record)
    end

    it { is_expected.to forbid_actions(%i[create show update destroy]) }
  end

  context 'when being a user' do
    let(:user) { FactoryBot.create(:user) }
    let!(:iteration_record) { FactoryBot.create(:iteration) }

    it 'excludes iteration_record in resolved scope' do
      expect(resolved_scope).not_to include(iteration_record)
    end

    it { is_expected.to forbid_actions(%i[create show update destroy]) }
  end

  context 'when being the user' do
    let(:user) { FactoryBot.create(:user) }
    let!(:iteration_record) { FactoryBot.create(:iteration, user: user) }

    it 'includes iteration_record in resolved scope' do
      expect(resolved_scope).to include(iteration_record)
    end

    it { is_expected.to permit_actions(%i[create show]) }
    it { is_expected.to forbid_actions(%i[update destroy]) }
  end

  context 'when being a admin' do
    let(:user) { FactoryBot.create(:user, admin: true) }

    it 'includes iteration_record in resolved scope' do
      expect(resolved_scope).to include(iteration_record)
    end

    it { is_expected.to permit_actions(%i[show]) }
    it { is_expected.to forbid_actions(%i[create update destroy]) }
  end
end
