
require('parseconfig')

# open RTS 
def openRTS(comport,sleeptime) 
  
  puts "opening RTS on #{comport} port..."
  system('ruby rts_open.rb ' + comport)
  sleep sleeptime

end

# close RTS 
def closeRTS(comport,sleeptime) 
  
  puts "closeing RTS on #{comport} port..."
  system('ruby rts_close.rb ' + comport)
  sleep sleeptime
end

# open DTR 
def openDTR(comport,sleeptime) 
  
  puts "opening DTR on #{comport} port..."
  system('ruby dtr_open.rb ' + comport)
  sleep sleeptime

end

# open DTR 
def closeDTR(comport,sleeptime) 
  
  puts "closeing DTR on #{comport} port..."
  system('ruby dtr_close.rb ' + comport)
  sleep sleeptime

end


# start the measure
def startMeasure() 
  
  puts "starting measurement..."
  config = ParseConfig.new('./rubyconfig')
  qmon_ftp_path =  config['qmon_ftp_path']
  sleeptime_between_measurements = config['sleeptime_between_measurements']
  Dir.chdir qmon_ftp_path
  system('./restart')
  sleep sleeptime_between_measurements
  
end


# start point


if (ARGV.length == 0)
  
    puts "Error:please give arguments (COM ports)!\nYou can check them with dmesg | grep tty command"
    
else

  ARGV.each do|comport|
  
    # open RTS port
    openRTS(comport,2)
    startMeasure();
    closeRTS(comport,2)
    
    # open DTR port
    openDTR(comport,2)
    startMeasure();
    closeDTR(comport,2)
    
  end
end

