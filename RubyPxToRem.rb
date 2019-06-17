require 'tempfile'
require 'fileutils'

def trim (num)
    i, f = num.to_i, num.to_f
    i == f ? i : f
end

def matchToPx(str)    
    # We use !! to convert the return value to a boolean
    !!(str =~ /\dpx/)  
end

def convertToPx(px,fontSize)
    # Convert 15px to 1,5rem for example
    pxValue = px.scan(/\d+/).first 
    remValue = (pxValue.to_f / fontSize.to_f).round(2)   
    return  "#{trim(remValue)}rem"
end

def ProcessFile(filename)
    puts "#{filename} has started processing..."
    path = filename
    temp_file = Tempfile.new('foo')
    begin
      File.open(path, 'r') do |file|
        file.each_line do |line|        
          if(matchToPx(line))       
            line = line.gsub(/\d+px/) { |pxValue| convertToPx(pxValue,10) }
            temp_file.puts line 
          else
            temp_file.puts line            
          end
        end
      end
      temp_file.close
      FileUtils.mv(temp_file.path, path)
    ensure
      temp_file.close
      temp_file.unlink
    end    
    puts "#{filename} has finished processing..."
end


puts "Convertion has started..."
Dir.glob("cssFiles/**/*.{css,scss}") do |fileName| 
    ProcessFile(fileName)    
end
puts "Convertion has finished..."








