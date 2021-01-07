# frozen_string_literal: true
require 'emend'

RSpec.describe 'Emend version' do

  before(:all) do
    @version = '1.4.0.84'
  end

  describe 'Version' do 
    it 'has a version number' do
      expect(Emend::VERSION).not_to be nil
    end

    it "version number must match #{Emend::VERSION}" do
      expect(Emend::VERSION).to eql(@version)
    end
  end

  describe '--version' do
    it 'has been used' do
      ARGV.replace ['--version']
      options = Emend::CommandLineOptions.parse(ARGV)
      expect(options[:version]).to be(true) 
    end
  end

end
