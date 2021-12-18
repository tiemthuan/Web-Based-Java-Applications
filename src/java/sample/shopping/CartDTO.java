/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class CartDTO {
    private Map<String, TeaDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, TeaDTO> cart) {
        this.cart = cart;
    }

    public Map<String, TeaDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, TeaDTO> cart) {
        this.cart = cart;
    }
   public boolean add(TeaDTO tea){
       boolean check= false;
       try{
           if(this.cart== null){
               this.cart= new HashMap<>();
           }
           if(this.cart.containsKey(tea.getId())){
               int currentQuantity= this.cart.get(tea.getId()).getQuantity();
               tea.setQuantity(currentQuantity+ tea.getQuantity());
           }
           this.cart.put(tea.getId(), tea);
           check= true;
       }catch(Exception e){
       
       }
       return check;
   }
   public boolean remove(String id){
       boolean check= false;
       try {
           if(this.cart!= null){
               if(this.cart.containsKey(id)){
                   this.cart.remove(id);
                   check= true;
               }
           }
       } catch (Exception e) {
       }
   return check;
   }
   public boolean update(String id, TeaDTO tea){
   boolean check= false;
       try {
           if (this.cart!= null) {
               if (this.cart.containsKey(id)) {
                   this.cart.replace(id, tea);
                   check= true;
               }
           }
       } catch (Exception e) {
       }
       return check;
   }
}
