package controller;

import java.util.Date;
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
import com.niit.model.OrderDetails;
import com.niit.model.Product;

@Controller
public class OrderController {

	@Autowired
	private CartItemDAO cartItemDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private OrderDetailsDAO orderDetailsDAO;

	@RequestMapping(value = { "Pay" })
	public String doPayment(Model m, HttpSession hs) {
		double price = 0, quantity = 0;
		String username = (String) hs.getAttribute("username");
		List<CartItem> cartItems = cartItemDAO.getAllUnpaidItem(username);
		for (CartItem cartItem : cartItems) {
			int subquan=cartItem.getQuantity();
			Product p=productDAO.getOneProduct(cartItem.getProductId());
			int temp=p.getQuantity()-subquan;
			p.setQuantity(temp);
			productDAO.addProduct(p);
			
			price = price + cartItem.getSubtotal();
			quantity = quantity + cartItem.getQuantity();
		}
		m.addAttribute("cartItems", cartItems);
		m.addAttribute("prodItems", listProducts());
		m.addAttribute("price", price);
		m.addAttribute("quantity", (int) quantity);
		return "PaymentPage";
	}

	public LinkedHashMap<Integer, String> listProducts() {
		List<Product> listProducts = productDAO.getAllProduct();
		LinkedHashMap<Integer, String> prodlist = new LinkedHashMap<Integer, String>();
		for (Product product : listProducts) {
			prodlist.put(product.getProductId(), product.getProdName());
		}
		return prodlist;
	}

	@RequestMapping(value = { "ConfirmPayment" })
	public String confirmPayment(@RequestParam("paymode") String paymode, @RequestParam("bname") String bname,
			@RequestParam("street") String street, @RequestParam("city") String city, @RequestParam("area") String area,
			@RequestParam("state") String state, @RequestParam("pincode") String pincode, Model m, HttpSession hs) {
		double price = 0;
		String username = (String) hs.getAttribute("username");
		List<CartItem> cartlist = cartItemDAO.getAllUnpaidItem(username);
		for (CartItem cartItem : cartlist) {
			price = price + cartItem.getSubtotal();
		}
		String shpAddr = bname + ", " + area + ", " + street + ", " + city + ", " + state + " - " + pincode;
		OrderDetails od = new OrderDetails();
		od.setUsername(username);
		od.setDeliveryStatus("Pending");
		od.setOrderDate(new Date());
		od.setShippingAddress(shpAddr);
		od.setTransactionType(paymode);
		od.setTotalAmount(price);
		orderDetailsDAO.addOrder(od);

		for (CartItem cartItem : cartlist) {
			cartItem.setPaymentStatus("p");
			cartItem.setOrderId(od.getOrderId());
			cartItemDAO.addCartItem(cartItem);
		}
		m.addAttribute("oid", od.getOrderId());
		return "PaymentPage";
	}

	@RequestMapping("dispatchOrder{orderId}")
	public String orderDispatcher(@PathVariable("orderId") int orderId, Model m) {
		OrderDetails od = orderDetailsDAO.getOrder(orderId);
		od.setDeliveryStatus("Dispatched");
		orderDetailsDAO.addOrder(od);
		m.addAttribute("pending", orderDetailsDAO.showAllPending());
		m.addAttribute("dispatched", orderDetailsDAO.showAllDispatched());
		return "ConsumerCart";
	}

	@RequestMapping("orderComplete{oid}")
	public String orderCompleter(@PathVariable("oid") int orderId, Model m) {
		OrderDetails od = orderDetailsDAO.getOrder(orderId);
		od.setDeliveryStatus("Sent");
		orderDetailsDAO.addOrder(od);
		m.addAttribute("pending", orderDetailsDAO.showAllPending());
		m.addAttribute("dispatched", orderDetailsDAO.showAllDispatched());
		return "ConsumerCart";
	}

	@RequestMapping("ViewOrder{orderId}")
	public String viewOrder(@PathVariable("orderId") int orderId, Model m) {
		List<CartItem> cartList = cartItemDAO.getByOrderId(orderId);
		m.addAttribute("prodList", listProducts());
		m.addAttribute("cartList", cartList);
		return "vieworder";
	}

	@RequestMapping(value = { "DeliveredItems", "MyPurchases" })
	public String delcntrl1(Model m, HttpSession hs) {
		String usrnm = (String) hs.getAttribute("username"), rle;
		Object o = hs.getAttribute("role");
		rle = o.toString();
		List<OrderDetails> orderlist = null;
		if (rle.equals("ROLE_ADMIN")) {
			orderlist = orderDetailsDAO.showAllSent();
		} else if (rle.equals("ROLE_USER")) {
			orderlist = orderDetailsDAO.showAllSent(usrnm);
		}
		m.addAttribute("orderlist", orderlist);
		return "PreviousPurchases";
	}

}
