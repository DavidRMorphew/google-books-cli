require_relative "./lib/api"
require_relative "./lib/book"
require_relative "./lib/cli"

# require_relative './.env'
require 'dotenv/load'
# Follow up on this to hide SSH key from being uploaded to Github and becoming accessible
# 
require 'pry'
require 'net/http'
require 'json'
require "awesome_print"
ap object, options = {}
# Require awesome-print gem here after you get things running. It's a flourish, not essential.

