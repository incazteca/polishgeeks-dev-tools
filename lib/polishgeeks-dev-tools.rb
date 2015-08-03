require 'yaml'
require 'yard'
require 'pry'
require 'fileutils'
require 'timecop'
require 'faker'
require 'ostruct'

base_path = File.dirname(__FILE__) + '/polishgeeks/dev-tools/*.rb'
Dir[base_path].each { |file| require file }

module PolishGeeks
  module DevTools
    # This is just an alias so we can use it from DevTools directly
    # @return [PolishGeeks::DevTools::Config.config]
    def self.config
      Config.config
    end

    # @return [String] root path of this gem
    def self.gem_root
      File.expand_path('../..', __FILE__)
    end

    # @return [String] app root path
    def self.app_root
      File.dirname(ENV['BUNDLE_GEMFILE'])
    end

    # Sets up the whole configuration
    # @param [Block] block
    def self.setup(&block)
      Config.setup(&block)
    end
  end
end

require 'polishgeeks/dev-tools/command/base'

commands_path = File.dirname(__FILE__) + '/polishgeeks/dev-tools/command/*.rb'
Dir[commands_path].each { |file| require file }

load 'polishgeeks/dev-tools/tasks/dev-tools.rake'
