package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.niit.DAO.ProductDAO;
import com.niit.model.Product;

@Controller
public class ProductDescController {

	@Autowired
	private ProductDAO productDAO;

	@RequestMapping("ProductDisplay")
	public String proddisp(Model m) {
		List<Product> prodList = productDAO.getAllProduct();
		m.addAttribute("prodList", prodList);
		return "ProductDisplay";
	}

	@RequestMapping(value = { "ProductDescription{prodid}" })
	public String proddesc(@PathVariable("prodid") int prodid, Model m) {
		Product prod = productDAO.getOneProduct(prodid);
		m.addAttribute("product", prod);
		return "ProductDesc";
	}
}
