#!/usr/bin/env ruby

class SmartParser
  def parse_file(path)
    file = File.readlines(path)
    overall_pages = Hash.new(0)
    unique_pages = Hash.new(0)

    lines = file.each do |line| 
      full_address = line.split(" ")[0]
      unique_pages[full_address] += 1

      address_without_params = full_address.split('/')[1]
      overall_pages[address_without_params] += 1
    end

    results = [overall_pages.sort_by {|k, v| -v}, unique_pages.sort_by {|k, v| -v}]

    puts "list of webpages with most page views ordered from most pages views to less page views"
    puts "--------------------------"
    results[0].each { |page| puts page[0] + ' ' + page[1].to_s + ' visits' }
    puts "--------------------------"
    puts "list of webpages with most unique page views also ordered"
    puts "--------------------------"
    results[1].each { |page| puts page[0] + ' ' + page[1].to_s + ' unique views' }
    results
  end
end
