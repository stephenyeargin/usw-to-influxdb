require 'net/http'
require 'socket'
require 'usagewatch_ext'

def sendData(payload)
  uri = URI.parse("http://localhost:8086")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new("/write?db=grafana")
  request.add_field('Content-Type', 'application/text')
  request.body = payload
  response = http.request(request)
end

usw = Usagewatch
host = Socket.gethostname

Kernel.loop do
  sendData "diskused,host=#{host} value=#{usw.uw_diskused}"
  sendData "diskused_perc,host=#{host} value=#{usw.uw_diskused_perc}"
  sendData "cpuused,host=#{host} value=#{usw.uw_cpuused}"
  sendData "memused,host=#{host} value=#{usw.uw_memused}"
  sendData "load,host=#{host} value=#{usw.uw_load}"
end
