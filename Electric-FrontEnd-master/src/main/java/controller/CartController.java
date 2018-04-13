package controller;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.DAO.CartItemDAO;
import com.niit.DAO.OrderDetailsDAO;
import com.niit.DAO.ProductDAO;
import com.niit.model.CartItem;
import com.niit.model.Product;

@Controller
public class CartController {
	@Autowired
	private CartItemDAO cartItemDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private OrderDetailsDAO orderDetailsDAO;

	@RequestMapping(value = { "AddToCart" })
	public String addToCart(@RequestParam("quantity") int quantity, @RequestParam("prodId") int prodId, Model m,
			HttpSession hs) {
		m.addAttribute("addcart", quantity + " piece of this product has been added to your cart!");
		Product prod = productDAO.getOneProduct(prodId);
		m.addAttribute("product", prod);
		double subtotal = (prod.getPrice()) * (quantity);
		String username = (String) hs.getAttribute("username");
		CartItem ci = new CartItem();
		ci.setPaymentStatus("np");
		ci.setProductId(prodId);
		ci.setQuantity(quantity);
		ci.setSubtotal(subtotal);
		ci.setUsername(username);
		ci.setOrderId(0);
		cartItemDAO.addCartItem(ci);
		m.addAttribute("c", ci);
		return "ProductDesc";
	}

	@RequestMapping(value = { "/Cart" })
	public String showCart(Model m, HttpSession hs) {
		double price = 0, quantity = 0;
		String username = (String) hs.getAttribute("username");
		List<CartItem> cartItems = cartItemDAO.getAllUnpaidItem(username);
		for (CartItem cartItem : cartItems) {
			price = price + cartItem.getSubtotal();
			quantity = quantity + cartItem.getQuantity();
		}
		m.addAttribute("cartItems", cartItems);
		m.addAttribute("prodItems", listProducts());
		m.addAttribute("price", price);
		m.addAttribute("quantity", (int) quantity);
		return "cart";
	}

	public LinkedHashMap<Integer, String> listProducts() {
		List<Product> listProducts = productDAO.getAllProduct();
		LinkedHashMap<Integer, String> prodlist = new LinkedHashMap<Integer, String>();
		for (Product product : listProducts) {
			prodlist.put(product.getProductId(), product.getProdName());
		}
		return prodlist;
	}

	@RequestMapping("DeleteCartItem{cartItemId}")
	public String deletecartitem(@PathVariable("cartItemId") int cartItemId,Model m, HttpSession hs) {
		cartItemDAO.deleteCartItem(cartItemId);
		m.addAttribute("delci", "Cart Item Deleted!");
		double price = 0, quantity = 0;
		String username = (String) hs.getAttribute("username");
		List<CartItem> cartItems = cartItemDAO.getAllUnpaidItem(username);
		for (CartItem cartItem : cartItems) {
			price = price + cartItem.getSubtotal();
			quantity = quantity + cartItem.getQuantity();
		}
		m.addAttribute("cartItems", cartItems);
		m.addAttribute("prodItems", listProducts());
		m.addAttribute("price", price);
		m.addAttribute("quantity", (int) quantity);
		return "cart";
	}
	
	@RequestMapping(value={"ConsumerCart"})
	public String showConsumerCart(Model m)
	{
		m.addAttribute("pending", orderDetailsDAO.showAllPending());
		m.addAttribute("dispatched", orderDetailsDAO.showAllDispatched());
		return "ConsumerCart";
	}
}
