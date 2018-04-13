package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.niit.DAO.SupplierDAO;
import com.niit.model.Supplier;

@Controller
public class SupplierController {
	@Autowired
	private SupplierDAO supplierDAO;

	@RequestMapping(value = { "/Supplier" }, method = RequestMethod.GET)
	public String suplogin(Model m) {
		List<Supplier> suplist = supplierDAO.getAllSupplier();
		m.addAttribute("suplist", suplist);
		m.addAttribute("supplier", new Supplier());
		return "Supplier";
	}

	@RequestMapping(value = { "/SaveSupplier" }, method = RequestMethod.POST)
	public String savecat(@ModelAttribute("supplier") Supplier sup) {
		supplierDAO.addSupplier(sup);
		return "redirect:Supplier";
	}

	@RequestMapping(value = { "DeleteSupplier{supplierId}" })
	public String deletecat(@PathVariable("supplierId") int supplierId) {
		supplierDAO.deleteSupplier(supplierId);
		return "redirect:Supplier";
	}

	@RequestMapping(value = { "UpdateSupplier{supid}" })
	public String updateSupplier(@PathVariable("supid") int supid, Model m) {
		Supplier sup= supplierDAO.getOneSupplier(supid);
		List<Supplier> suplist = supplierDAO.getAllSupplier();
		m.addAttribute("suplist", suplist);
		m.addAttribute("supplier", sup);
		return "Supplier";
	}
}
