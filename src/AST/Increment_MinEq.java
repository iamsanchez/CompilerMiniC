/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AST;

/**
 *
 * @author Agile-PC
 */
public class Increment_MinEq extends Increment{
     
    Expression e;
    public Increment_MinEq(Expression e){
        this.e = e;
    }
    
}
