/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AST;

/**
 *
 * @author C5220696
 */
public class Statement_Inside_If_Simple extends Statement_Inside_If {
    Statement_List sl;

    public Statement_Inside_If_Simple(Statement_List sl) {
        this.sl = sl;
    }
    
}
