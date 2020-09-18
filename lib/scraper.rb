
require 'nokogiri'
require 'open-uri'
require 'byebug'

class Scraper
  attr_reader :url, :unparsed_page, :parsed_page

  def initialize(url, _unparsed_page, _parsed_page)
    @url = url
    @unparsed_page = ::OpenURI.open_uri(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
  end

  def scrape
    jobs = []
    job_lists = @parsed_page.css('li.job.inline.featured')
    job_lists.each do |job_list|
      job = {
        title: job_list.css('a.jobTitle').text,
        companyname: job_list.css('a.companyName').text,
        location: job_list.css('span.jobLocation').text,
        application: job_list.css('span.applications').text
      }
      job.each do |key, value|
        puts "||#{key.capitalize} : #{value.capitalize}||"
        puts '--------------'
      end
      puts '            '
      puts '            '
      jobs << job
    end
    jobs.count
  end
end
