/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

/**
 *
 * @author sebas
 */
public class tablaErrores {
         
    public int contador = 0;
    public String tipoError;
    public int fila;
    public int columna;
    public String infoError;
    
    
    
    public tablaErrores(int contador, String tipoError, String infoError, int fila, int columna){
        
        this.contador = contador;
        this.tipoError = tipoError;
        this.fila = fila;
        this.columna = columna;
        this.infoError = infoError;
        
    }
}

    

