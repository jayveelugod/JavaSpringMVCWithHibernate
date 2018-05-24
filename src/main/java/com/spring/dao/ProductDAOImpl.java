package com.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.Product;
import com.spring.model.Category;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addProduct(Product product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	}

	@SuppressWarnings("unchecked")
	public List<Product> getAllProducts() {
		List<Product> productList = new ArrayList<Product>();
		List<?> list = sessionFactory.getCurrentSession().createQuery("from Category as cat inner join cat.product as prod").list();
		for(int i=0; i<list.size(); i++) {
			Object[] row = (Object[]) list.get(i);
			Category category = (Category)row[0];
			Product product = (Product)row[1];
			product.setCategoryName(category.getCategoryName());
			productList.add(product);
		}
		return productList;
	}

	@Override
	public void deleteProduct(Integer prodId) {
		Product product = (Product) sessionFactory.getCurrentSession().load(
				Product.class, prodId);
		if (null != product) {
			this.sessionFactory.getCurrentSession().delete(product);
		}

	}

	public Product getProduct(int prodid) {
		return (Product) sessionFactory.getCurrentSession().get(
				Product.class, prodid);
	}

	@Override
	public Product updateProduct(Product product) {
		sessionFactory.getCurrentSession().update(product);
		return product;
	}
	
	public List<Category> getProductCategories(){
		return sessionFactory.getCurrentSession().createQuery("from Category").list();
	}

}