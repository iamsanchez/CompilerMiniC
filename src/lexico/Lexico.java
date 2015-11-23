/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexico;


/**

* Clase que representa un analizador léxico.

* @author Mª Angeles Broullón Lozano, Ana Mª Fernández Hernández.

*/
import java.io.*;

public class Lexico {
static public void main(String argv[]) throws IOException, Exception {    
    /* Start the parser */
    String a[] = {"JFLEX.flex"};
    String b[] = {"CUP.cup"};
    jflex.Main.main(a);
    System.out.println("No");
    java_cup.Main.main(b);
    
    System.out.println("here?");
    	InputStream inStreamSYM = null;
        InputStream inStreamPARSER = null;
	OutputStream outStreamSYM = null;
        OutputStream outStreamPARSER = null;
        InputStream inStreamYYLEX = null;
	OutputStream outStreamYYLEX = null;
        	
    	try{
    		
    	    File afile =new File("sym.java");
            File bfile =new File("parser.java");
            File cfile = new File("Yylex.java");
    	    File dfile =new File("./src/lexico/sym.java");
            File efile =new File("./src/lexico/parser.java");
            File ffile =new File("./src/lexico/yylex.java");
    		
    	    inStreamSYM = new FileInputStream(afile);
    	    inStreamPARSER = new FileInputStream(bfile);
            inStreamYYLEX = new FileInputStream(cfile);
            outStreamSYM = new FileOutputStream(dfile);
            outStreamPARSER = new FileOutputStream(efile);
            outStreamYYLEX = new FileOutputStream(ffile);
        	
    	    byte[] buffer = new byte[1024];
    		
    	    int length;
    	    //copy the file content in bytes 
    	    while ((length = inStreamSYM.read(buffer)) > 0){
    	  
    	    	outStreamSYM.write(buffer, 0, length);
    	 
    	    }
    	 
    	    inStreamSYM.close();
    	    outStreamSYM.close();
    	    byte[] buffer2 = new byte[1024];
              while ((length = inStreamPARSER.read(buffer2)) > 0){
    	  
    	    	outStreamPARSER.write(buffer2, 0, length);
    	 
    	    }
    	 
    	    inStreamPARSER.close();
    	    outStreamPARSER.close();
            
             byte[] buffer3 = new byte[1024];
              while ((length = inStreamYYLEX.read(buffer3)) > 0){
    	  
    	    	outStreamYYLEX.write(buffer3, 0, length);
    	 
    	    }
    	 
    	    inStreamYYLEX.close();
    	    outStreamYYLEX.close();
    	    //delete the original file
    	    afile.delete();
            bfile.delete();
            cfile.delete();
    	    
    	    System.out.println("File is copied successful!");
    	    
    	}catch(IOException e){
    	    e.printStackTrace();
    	}
        
        System.out.println("Llegue");
    parser p;
        try {
            
            p = new parser(new Yylex(new java.io.FileReader("entrada.txt.txt")));
            p.parse();
        }
        catch(Exception e) { System.out.println(e.getMessage());
        
        }
}

}


