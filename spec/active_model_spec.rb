require 'spec_helper'

describe Hecks::ActiveModel do
  let(:meeting) do
    APP[:Meetings].build(
      participants: [],
      discussion: nil,
      timebox: nil,
      id: 3
    )
  end

  describe '#to_param' do
    it '#returns the value of ID' do
      expect(meeting.to_param).to eq '3'
    end
  end

  describe '#persisted?' do
    it 'true if there is an id' do
      expect(meeting.persisted?).to eq true
    end
  end

  describe '#new_record?' do
    it 'false if id is present' do
      expect(meeting.new_record?).to eq false
    end
  end

  context 'class methods' do
    subject { APP[Meetings: :Meeting] }

    describe '#model_name' do
      it 'should return the domain model class name' do
        expect(subject.model_name).to eq('Meetings::Meeting')
      end
    end

    describe '#primary_key' do
      it '#primary_key' do
        expect(subject.primary_key).to eq :id
      end
    end
  end
end
