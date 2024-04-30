# frozen_string_literal: true

require 'json'

RSpec.describe 'Game Integration Test' do
  let(:test_log) { 'spec/resources/test_qgames.log' }
  let(:expected_output_file) { 'spec/resources/expected_output.json' }
  let(:output_file) { 'spec/resources/output.json' }

  it 'generates correct game stats JSON' do
    system("ruby parser.rb #{test_log} #{output_file}")

    expected_output = JSON.parse(File.read(expected_output_file))
    generated_output = JSON.parse(File.read(output_file))

    expect(generated_output).to eq(expected_output)
  end
end
