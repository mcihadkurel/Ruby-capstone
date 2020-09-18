
require 'spec_helper'
require_relative '../bin/main.rb'

describe Scraper do
  describe '#scrape' do
    let(:scrap) { Scraper.new('https://cryptojobslist.com/', @doc, @document) }
    it 'when getting the joblist' do
      expect(scrap.scrape).to equal(30)
    end
  end
end
