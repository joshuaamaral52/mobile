package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.DAO.CategoryDAO;
import com.niit.model.Category;

@Controller
public class CategoryController {
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = { "/Category" }, method = RequestMethod.GET)
	public String catcntrl(Model m) {
		List<Category> catlist = categoryDAO.getAllCategory();
		m.addAttribute("catList", catlist);
		m.addAttribute("category", new Category());
		return "category";
	}

	@RequestMapping(value = { "/SaveCategory" }, method = RequestMethod.POST)
	public String savecat(@ModelAttribute("category") Category cat) {
		categoryDAO.addCategory(cat);
		return "redirect:Category";
	}

	@RequestMapping(value = { "DeleteCategory{catid}" })
	public String deletecat(@PathVariable("catid") int catid) {
		categoryDAO.deleteCategory(catid);
		return "redirect:Category";
	}

	@RequestMapping(value = { "UpdateCategory{catid}" })
	public String updateCategory(@PathVariable("catid") int catid, Model m) {
		Category cat = categoryDAO.getOneCategory(catid);
		List<Category> catlist = categoryDAO.getAllCategory();
		m.addAttribute("catList", catlist);
		m.addAttribute("category", cat);
		return "category";
	}
}
