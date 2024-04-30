# frozen_string_literal: true

require 'json'
require './lib/log_processor'

if __FILE__ == $PROGRAM_NAME
  if ARGV.empty?
    puts 'Usage: ruby parser.rb [log_file]'
    exit(1)
  end

  file_path = ARGV[0]
  output_file = ARGV[1] || 'resources/game_stats.json'
  LogProcessor.new(file_path, output_file).process_log_file
end
