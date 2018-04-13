package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.DAO.OrderDetailsDAO;
import com.niit.model.OrderDetails;
import com.niit.model.User;

@Controller
public class PageController {

	@RequestMapping(value = { "/", "/index" })
	public String indexcntrl() {
		return "index";
	}

	@RequestMapping(value = { "login007" })
	public String userlogin() {
		return "UserLogin";
	}

	@RequestMapping(value = { "/Register" })
	public String regcntrl(Model m) {
		m.addAttribute("user", new User());
		return "register";
	}
}
