require 'spec_helper'

describe Hecks::ActiveModel do
  describe '#decorate' do
    before do
      Hecks::ActiveModel.decorate
    end

    it do
      expect(APP[Meetings: :Meeting].runnable.model_name).to eq('Meetings::Meeting')
    end

    it '#to_param' do
      meeting = APP[:Meetings].new(
        participants: [],
        discussion: nil, 
        timebox: nil, 
        id: 3
      ).to_param
      expect(meeting.to_param).to eq '3'
    end
  end
end
