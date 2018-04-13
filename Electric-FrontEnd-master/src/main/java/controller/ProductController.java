package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.DAO.CategoryDAO;
import com.niit.DAO.ProductDAO;
import com.niit.DAO.SupplierDAO;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class ProductController {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private SupplierDAO supplierDAO;

	@RequestMapping(value = { "Product" }, method = RequestMethod.GET)
	public String prodcntrl(Model m) {
		List<Product> prodList = productDAO.getAllProduct();
		m.addAttribute("prodList", prodList);
		m.addAttribute("catList", listCategories());
		m.addAttribute("supList", listSuppliers());
		m.addAttribute("product", new Product());
		return "Product";
	}

	public LinkedHashMap<Integer, String> listCategories() {
		List<Category> listCategories = categoryDAO.getAllCategory();
		LinkedHashMap<Integer, String> catlist = new LinkedHashMap<Integer, String>();
		for (Category category : listCategories) {
			catlist.put(category.getCatid(), category.getCatName());
		}
		return catlist;
	}

	public LinkedHashMap<Integer, String> listSuppliers() {
		List<Supplier> listSupplier = supplierDAO.getAllSupplier();
		LinkedHashMap<Integer, String> suplist = new LinkedHashMap<Integer, String>();
		for (Supplier supplier : listSupplier) {
			suplist.put(supplier.getSupplierId(), supplier.getSupplierName());
		}
		return suplist;
	}

	@RequestMapping(value = { "/SaveProduct" }, method = RequestMethod.POST)
	public String saveProd(@ModelAttribute("product") Product product,@RequestParam("image") MultipartFile filedet,BindingResult result) {
		productDAO.addProduct(product);
		
		String imagepath="D:\\ElectricProject\\Electric-FrontEnd-master\\src\\main\\webapp\\resources\\images\\"+String.valueOf(product.getProductId())+".jpg";
		//String imagepath=req.getSession().getServletContext().getRealPath("/")+"\\images\\"+String.valueOf(product.getProductId())+".jpg";
		System.out.println(imagepath);
		File image=new File(imagepath);
		if(!filedet.isEmpty())
		{
			try 
			{
				byte[] fileBuffer=filedet.getBytes();	
				FileOutputStream fos=new FileOutputStream(image);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			} catch (Exception e)
			{
				System.out.println("Exception Arised:"+e);
			}
			
		}
		else
		{
			System.out.println("Problem Occured in File Uploading");
		}
		return "redirect:Product";
	}

	@RequestMapping(value = { "DeleteProduct{prodid}" })
	public String deleteProduct(@PathVariable("prodid") int prodid) {
		productDAO.deleteProduct(prodid);
		return "redirect:Product";
	}

	@RequestMapping(value = { "UpdateProduct{prodid}" })
	public String updateProduct(@PathVariable("prodid") int prodid,Model m) {
		Product prod=productDAO.getOneProduct(prodid);
		List<Product> prodList = productDAO.getAllProduct();
		m.addAttribute("prodList", prodList);
		m.addAttribute("catList", listCategories());
		m.addAttribute("supList", listSuppliers());
		m.addAttribute("product", prod);
		return "Product";
	}
}
