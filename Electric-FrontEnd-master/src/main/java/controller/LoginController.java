package controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.DAO.UserDAO;
import com.niit.model.User;

@Controller
public class LoginController {
	@Autowired
	private UserDAO userDAO;

	@RequestMapping(value = { "SaveUser" }, method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("user") User user, Model m) {
		user.setEnable(true);
		user.setRole("ROLE_USER");
		userDAO.addUser(user);
		m.addAttribute("msg", "<strong>Registeration Successfull!</strong>&nbsp;Please Login to start Shopping!!!");
		return "register";
	}

	@RequestMapping("/Login_success")
	public String showHomePage(HttpSession session, Model m) {

		String page = "";
		boolean loggedIn = false;

		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();

		String username = authentication.getName();

		Collection<GrantedAuthority> roles = (Collection<GrantedAuthority>) authentication.getAuthorities();

		for (GrantedAuthority role : roles) {
			session.setAttribute("role", role);

			if (role.getAuthority().equals("ROLE_ADMIN")) {
				loggedIn = true;
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("username", username);
				page="index";
			} else {
				loggedIn = true;
				session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("username", username);
				page="index";
			}
		}
		return page;
	}

	@RequestMapping("/Login_Error")
	public String showError(Model m) {
		m.addAttribute("msg", "Please check your login details. The credentials are invalid!!!");
		return "UserLogin";
	}
}
