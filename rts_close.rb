require 'serialport'

comport = ARGV[0]

sp = SerialPort.new comport, 9600
sp.rts = 0
sp.close