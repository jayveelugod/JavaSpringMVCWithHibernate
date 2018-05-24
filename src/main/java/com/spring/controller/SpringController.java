package com.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.Category;
import com.spring.model.Product;
import com.spring.service.ProductService;

@Controller
public class SpringController {

	public SpringController() {
		System.out.println("SpringController()");
	}
	

	@Autowired
	private ProductService productService;
	
	
			
	@RequestMapping(value = "/app-home", method = RequestMethod.GET)
	public ModelAndView listProduct(ModelAndView model) throws IOException {
		List<Product> listProduct = productService.getAllProducts();
		model.addObject("listProduct", listProduct);
		model.setViewName("app-home");
		return model;
	}

	@RequestMapping(value = "/app-newProduct", method = RequestMethod.GET)
	public ModelAndView newProduct(ModelAndView model) {
		Product product = new Product();
		model.addObject("product", product);
		Map<Integer,String> category = new LinkedHashMap<Integer,String>();
		List<Category> listCategory = productService.getProductCategories();
		for(Category cat: listCategory) {
			category.put(cat.getCategoryID(), cat.getCategoryName());
		}
		System.out.println(category);
		model.addObject("listCategory", category);
		model.setViewName("app-newProductForm");
		return model;
	}

	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public ModelAndView saveProduct(@ModelAttribute Product product) {
		if (product.getProductID() == 0) {
			productService.addProduct(product);
		} else {
			productService.updateProduct(product);
		}
		return new ModelAndView("redirect:/app-home");
	}

	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	public ModelAndView deleteProduct(HttpServletRequest request) {
		int productId = Integer.parseInt(request.getParameter("id"));
		System.out.println(productId);
		productService.deleteProduct(productId);
		return new ModelAndView("redirect:/app-home");
	}

	@RequestMapping(value = "/editProduct", method = RequestMethod.GET)
	public ModelAndView editProduct(HttpServletRequest request) {
		int productId = Integer.parseInt(request.getParameter("id"));
		Product product = productService.getProduct(productId);
		Map<Integer,String> category = new LinkedHashMap<Integer,String>();
		List<Category> listCategory = productService.getProductCategories();
		for(Category cat: listCategory) {
			category.put(cat.getCategoryID(), cat.getCategoryName());
		}
		System.out.println(category);
		ModelAndView model = new ModelAndView("app-newProductForm");
		model.addObject("product", product);
		model.addObject("listCategory", category);

		return model;
	}
	
	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

			ModelAndView model = new ModelAndView();
			if (error != null) {
				model.addObject("error", "Invalid username and/or password!");
			}

			if (logout != null) {
				model.addObject("msg", "You've been logged out.");
			}
			model.setViewName("app-login");
			
			return model;
		
	}

}