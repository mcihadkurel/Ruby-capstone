
# !/usr/bin/env ruby

require 'csv'
require_relative '../lib/scraper.rb'

private

def hostel_card
  parsed_page.css('li.job.inline.featured')
end

Scraper.new('https://cryptojobslist.com/', @unparse, @parsed_page).scrape
