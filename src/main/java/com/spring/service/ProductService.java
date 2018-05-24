package com.spring.service;

import java.util.List;

import com.spring.model.Product;
import com.spring.model.Category;

public interface ProductService {
	
	public void addProduct(Product product);

	public List<Product> getAllProducts();

	public void deleteProduct(Integer productId);

	public Product getProduct(int productid);

	public Product updateProduct(Product product);
	
	public List<Category> getProductCategories(); 
}
