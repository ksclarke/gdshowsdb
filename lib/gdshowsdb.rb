require "gdshowsdb/version"

require 'rubygems'
require 'sqlite3'
require 'active_record'

Dir[File.dirname(__FILE__) + '/gdshowsdb/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/gdshowsdb/db/migrations/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/gdshowsdb/models/extensions/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/gdshowsdb/models/*.rb'].each {|file| require file }

module Gdshowsdb
  ActiveRecord::Base.establish_connection(
	  :adapter => 'sqlite3',
	  :database => 'test.db'
	)

	CreateSongRefTable.new.migrate :change
	ImportSongRefs.new.migrate :change
	CreateShowTable.new.migrate :change
	CreateShowSetTable.new.migrate :change
	CreateSongTable.new.migrate :change
end

