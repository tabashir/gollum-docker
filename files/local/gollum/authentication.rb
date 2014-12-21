# authentication.rb
require 'rubygems'
require 'yaml'

module Precious

  class App < Sinatra::Base
		@thisdir = File.expand_path(File.dirname(__FILE__))
		User = Struct.new(:name, :email, :password_hash)

		before /^\/(edit|create|delete|livepreview|revert)/ do
			authorize_write!
		end

		helpers do
			def authorize_write!
				@_auth ||=  Rack::Auth::Basic::Request.new(request.env)
				if @_auth.provided?
				end
				if @_auth.provided? && @_auth.basic? && @_auth.credentials &&
					@user = detected_user(@_auth.credentials)
					return @user
				else
					response['WWW-Authenticate'] = %(Basic realm="Wiki Edit")
					throw(:halt, [401, "Not authorized\n"])
				end
			end

			def users
				@authorized_users = YAML.load_file(File.expand_path('users.yml', @thisdir))
				@_users ||= @authorized_users.map {|u| User.new(*u) }
			end

			def detected_user(credentials)
				users.detect do |u|
					[u.email, u.password_hash] ==
					[credentials[0], Digest::SHA1.hexdigest(credentials[1])]
				end
			end
		end

		def commit_message
			{
				:message => params[:message],
				:name => @user.name,
				:email => @user.email
			}
		end
	end
end
