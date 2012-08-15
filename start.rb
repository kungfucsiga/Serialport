
# start the measure
def startmeasure(comport)
  
end

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


# start point


ARGV.each do|comport|

  # close RTS and DTP ports
  closeDTR(comport,2)
  openRTS(comport,2)
 
end


