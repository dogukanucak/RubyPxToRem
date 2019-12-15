#!/usr/bin/ruby
require 'tempfile'
require 'fileutils'
require 'optparse'

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

def ProcessFile(filename,fontSize)
    puts "#{filename} has started processing..."
    path = filename
    temp_file = Tempfile.new('foo')
    begin
      File.open(path, 'r') do |file|
        file.each_line do |line|        
          if(matchToPx(line))       
            line = line.gsub(/\d+px/) { |pxValue| convertToPx(pxValue,fontSize) }
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


options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: ./RubyPxToRem.rb [options]"

  opts.on("-p", "--path=PATH", "Folder path to be converted. Default value: 'cssFiles' ") do |v|    
    options[:styles_path] = v
  end

  opts.on("-f", "--font-size=PATH", "Font Size to calculate Rem values. Calculation will be done as <PX-VALUE> / <FONT-SIZE>. Default value: '10'") do |v|    
    options[:font_size] = v
  end


 
  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end

end

begin parser.parse! ARGV
rescue OptionParser::InvalidOption => e
  puts e
  puts parser
  exit 1
  end

#Check parameters
path = options[:styles_path] || "cssFiles"
font_size = options[:font_size] || 10

 

puts "#{path} will be processed recusively"
puts "Font size: #{font_size}"
puts "Convertion has started..."

Dir.glob("#{path}/**/*.{css,scss}") do |fileName| 
    ProcessFile(fileName,font_size)    
end
puts "Convertion has finished..."








