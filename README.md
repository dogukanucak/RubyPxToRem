# RubyPxToRem
Small hobby project to convert px values to rem values in CSS/SCSS files.<br>
This Ruby script converts the PX values in CSS/SCSS files in given folder path recursively to REM values.

<pre>Usage: ./RubyPxToRem.rb [options]
    -p, --path=PATH                  Folder path to be converted. Default value: &apos;cssFiles&apos; 
    -f, --font-size=FONTSIZE         Font Size to calculate Rem values. Calculation will be done as &lt;PX-VALUE&gt; / &lt;FONT-SIZE&gt;. Default value: &apos;10&apos;
    -h, --help                       Prints this help
</pre>


Example: <br> 
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
     
    div.a
    {
        font-size: 1.5rem;
    }
    
    square 
    {
      width: 20rem;
      height: 20rem;
    }
  
  
  
