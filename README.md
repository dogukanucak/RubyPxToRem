# RubyPxToRem
Small Hobby Project To Conver Px Values To Rem In CSS/SCSS
This Ruby script converts the PX values in CSS/SCSS files in given folder path recursively to REM values.

Usage: ./RubyPxToRem.rb [options]
    -p, --path=PATH                  Folder path to be converted. Default value: 'cssFiles' 
    -f, --font-size=PATH             Font Size to calculate Rem values. Calculation will be done as <PX-VALUE> / <FONT-SIZE>. Default value: '10'
    -h, --help                       Prints this help


Example: 
  // styles/test.css
    div.a
    {
        font-size: 15px;
    }
    
    square 
    {
      width: 200px;
      height: 200px;
    }
    
  // ./RubyPxToRem.rb -p styles/
  // After convertion
     div.a
    {
        font-size: 1.5rem;
    }
    
    square 
    {
      width: 20rem;
      height: 20rem;
    }
  
  
  
