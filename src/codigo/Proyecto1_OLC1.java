/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;


/**
 *
 * @author sebas
 */
public class Proyecto1_OLC1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Interfaz ven =new Interfaz();
        ven.setVisible(true);
        generarAnalizadores();
    }
     private static void generarAnalizadores() 
    {
        try {
            String ruta = "src/codigo/";
            String opcFlex[] = {ruta + "lexicoCup.jflex", "-d", ruta};
            jflex.Main.generate(opcFlex);
            
            String opcCUP[] = {"-destdir", ruta, "-parser", "sintactico", ruta + "sintactico.cup"};
            java_cup.Main.main(opcCUP);
            
        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }
    
    
}
