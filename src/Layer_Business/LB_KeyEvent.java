/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import java.awt.event.KeyEvent;

/**
 *
 * @author KGR
 */
public class LB_KeyEvent 
{

    public LB_KeyEvent() {}
    
    public void CharactersMayusAndCharactersMin(java.awt.event.KeyEvent evt)
    {
        char c = evt.getKeyChar();
            if ((c < 'a' || c > 'z') && (c < 'A' || c > 'Z') && (c!= (char)KeyEvent.VK_SPACE)) 
            {
                evt.consume();
            }
    }
    
    public void NumbersAndCharactersMin(java.awt.event.KeyEvent evt)
    {
        char c = evt.getKeyChar();
        if ((c < '0' || c > '9') && (c < 'a' || c > 'z') &&
            (c!= (char)KeyEvent.SHIFT_DOWN_MASK) && (c!= (char)KeyEvent.VK_PERIOD))
        {
            evt.consume();
        }
    }
    
    public void NumbersAndCharactersMayus(java.awt.event.KeyEvent evt)
    {
        char c = evt.getKeyChar();
        if ((c < '0' || c > '9') && (c < 'A' || c > 'Z') 
                && (c!= (char)KeyEvent.VK_SPACE))
        {
            evt.consume();
        }
    }
    
    public void NumbersAndCharactersMinAndCharactersMayus(java.awt.event.KeyEvent evt)
    {
        char c = evt.getKeyChar();
        if ((c < '0' || c > '9') && (c < 'A' || c > 'Z') && (c < 'a' || c > 'z') 
                && (c!= (char)KeyEvent.VK_SPACE))
        {
            evt.consume();
        }
    }
    
    public void Numbers(java.awt.event.KeyEvent evt)
    {
        char c = evt.getKeyChar();
        if ((c < '0' || c > '9') && (c!= (char)KeyEvent.VK_SPACE))
        {
            evt.consume();
        }
    }
    
}
