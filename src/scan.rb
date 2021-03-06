require 'socket'
require_relative '../stats/messages'

def simple_scan(ip)
  port = [
    21, 22, 80, 110, 111,
    135, 443, 445, 8080, 8082
  ]
  for i in port
    begin
      host = ip
      socket = TCPSocket.new(host, i)
      rest = "open"
      print "\033[0;0m["
      print "\033[1;92m#"
      print "\033[0;0m]"
      puts " Port #{i} is #{rest}"
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      rest = "closed"
    end
  end
  puts "Scanned all ports"
  exit(0)
end
def verbose_scan(host)
  ip = (host)
  ports = [20, 21, 22, 23, 24, 53, 80, 110, 111,
    135, 139, 143, 443, 445, 993, 995, 
    1723, 3306, 3389, 5900, 8080, 8082]
  for i in ports
    begin
      socket = TCPSocket.new(ip, i)
      verbose_start(ip, "ok")
      rest = "open"
      print "\033[0;0m["
      print "\033[1;92m#"
      print "\033[0;0m]"
      puts " Port #{i} is #{rest}"
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      rest = "closed"
    end
  end
  puts "Scanned all ports"
  exit(0)
end
def scan_timeout(host, timeout)
  ip = (host)
  ports = [20, 21, 22, 23, 24, 53, 80, 110, 111,
    135, 139, 143, 443, 445, 993, 995, 
    1723, 3306, 3389, 5900, 8080, 8082]

  for i in ports
    begin
      socket = TCPSocket.new(ip, i)
      sleep(timeout)
      rest = "open"
      print "\033[0;0m["
      print "\033[1;92m#"
      print "\033[0;0m]"
      puts " Port #{i} is #{rest}"
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      rest = "closed"
    end
  end
  puts "Scanned all ports"
  exit(0)
end
def top_scan(host)
  ip = (host)
  ports = [20, 21, 22, 23, 24, 53, 80, 110, 111,
    135, 139, 143, 443, 445, 993, 995, 
    1723, 3306, 3389, 5900, 8080, 8082]

  for i in ports
    begin
      socket = TCPSocket.new(ip, i)
      rest = "open"
      print "\033[0;0m["
      print "\033[1;92m#"
      print "\033[0;0m]"
      puts " Port #{i} is #{rest}"
    rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
      rest = "closed"
    end
  end
  puts "Scanned all ports"
  exit(0)
end