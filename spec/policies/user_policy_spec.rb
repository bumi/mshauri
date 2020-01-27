# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class.new(user, user_record) }

  let(:resolved_scope) do
    described_class::Scope.new(user, User.all).resolve
  end

  let(:user_record) { FactoryBot.create(:user) }

  context 'when being a visitor' do
    let(:user) { nil }

    it 'excludes user_record in resolved scope' do
      expect(resolved_scope).not_to include(user_record)
    end

    it { is_expected.to permit_action(:create) }
    it { is_expected.to forbid_actions(%i[show update destroy]) }
  end

  context 'when being a user' do
    let(:user) { FactoryBot.create(:user) }

    it 'excludes user_record in resolved scope' do
      expect(resolved_scope).not_to include(user_record)
    end

    it { is_expected.to permit_action(:create) }
    it { is_expected.to forbid_actions(%i[show update destroy]) }
  end

  context 'when being the user' do
    let(:user) { FactoryBot.create(:user) }
    let(:user_record) { user }

    it 'includes user_record in resolved scope' do
      expect(resolved_scope).to include(user_record)
    end

    it { is_expected.to permit_actions(%i[create show]) }
    it { is_expected.to forbid_actions(%i[update destroy]) }
  end

  context 'when being a admin' do
    let(:user) { FactoryBot.create(:user, admin: true) }

    it 'includes user_record in resolved scope' do
      expect(resolved_scope).to include(user_record)
    end

    it { is_expected.to permit_actions(%i[create show]) }
    it { is_expected.to forbid_actions(%i[update destroy]) }
  end
end
