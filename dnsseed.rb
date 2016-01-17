#!/usr/bin/env ruby
require 'net/dns'
require 'net/ping/tcp'

dnsseed = ARGV.fetch(0) do
  puts "Please provide dnsseed: ./dnsseed.rb dnsname [threshold=0] [port=0] [timeout=5]"
  exit 1
end

threshold = ARGV.fetch(1) { 0 }.to_i
port      = ARGV[2].to_i
timeout   = ARGV.fetch(3) { 5 }.to_i

resolver = Net::DNS::Resolver.start(dnsseed)
nodes = resolver.answer.size

puts "#{nodes} active nodes"

if nodes > 0
  puts
  resolver.each_address do |ip|
    print ip
    if port > 0
      if Net::Ping::TCP.new(ip.to_s, port, timeout).ping
        print " is alive"
      else
        print " is unresponsive"
      end
    end
    puts
  end
end

if nodes < threshold
  exit 1
end
