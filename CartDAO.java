package com.suman.ecom.dao;

import java.util.List;

import com.suman.ecom.model.Cart;

public interface CartDAO {
	public boolean save(Cart cart);

	public boolean update(Cart cart);

	public boolean delete(Cart cart);

	public Cart getbyid(int id);
	
	/*public List<Cart> mycartproducts(String id);*/
	
	public int totalproducts(String id);

	public int totalprice(String id);
	
	/*public boolean orphanremoval(String id);*/
	
	public List<Cart> list();




}
