/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author min
 */
public class Cart {
    private Map<String, PetFood> cart;

    public Cart() {
    }

    public Cart(Map<String, PetFood> cart) {
        this.cart = cart;
    }

    public Map<String, PetFood> getCart() {
        return cart;
    }

    public void setCart(Map<String, PetFood> cart) {
        this.cart = cart;
    }

    public boolean add(PetFood food) {
        boolean result = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(food.getId())) {
            int currentQuantity = this.cart.get(food.getId()).getQuantity();
            food.setQuantity(currentQuantity + food.getQuantity());
        }
        this.cart.put(food.getId(), food);
        result = true;
        return result;
//        if (this.cart == null) {
//            this.cart = new HashMap<String, PetFood>();
//        }
//        if (this.cart.containsKey(food.getId())) {
//            int currentQuantity = this.cart.get(food.getId()).getQuantity();
//            food.setQuantity(currentQuantity + food.getQuantity());
//        }
//        this.cart.put(food.getId(), food);
    }

    public boolean update(String id, PetFood f) {
        boolean result = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, f);
                result = true;
            }
        }
        return result;
    }
    
    public boolean remove(String id) {
        boolean result = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                result = true;
            }
        }
        return result;
    }
    
//    public void update(String id, PetFood newFood) {
//        if (this.cart == null) {
//            return;
//        }
//        if (this.cart.containsKey(id)) {
//            this.cart.replace(id, newFood);
//        }
//    }

//    public void remove(String id) {
//        if (this.cart == null) {
//            return;
//        }
//        if (this.cart.containsKey(id)) {
//            this.cart.remove(id);
//        }
//    }
//    private String userId;
//    private Map<PetFood, Integer> items;
//
//    public String getUserId() {
//        return userId;
//    }
//
//    public void setUserId(String userId) {
//        this.userId = userId;
//    }
//  
//    public Map<PetFood, Integer> getItems() {
//        return items;
//    }
//
//    public void setItems(Map<PetFood, Integer> items) {
//        this.items = items;
//    }
//    
//    public void addItemToCart(PetFood food) {
//        if(items == null) {
//            items = new HashMap<>();
//        }
//        int quantity = 1;
//        if(items.containsKey(food)) {
//            quantity = items.get(food)+1;
//        }
//        items.put(food, quantity);
//    }
//    
//    public void removeItemFromCart(PetFood food) {
//        if(items == null) {
//            return;
//        }
//        if(items.containsKey(food)) {
//            items.remove(food);
//        }
//        if(items.isEmpty()) {
//            items = null;
//        }
//    }
}
