require 'spec_helper'

describe Hecks::ActiveModel do
  describe '#decorate' do
    before do
      Hecks::ActiveModel.decorate
    end

    it do
      expect(APP[:Meetings].runnable.model_name).to eq('Meetings::Meeting')
    end
  end
end
