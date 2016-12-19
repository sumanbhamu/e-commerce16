package com.suman.Controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suman.ecom.dao.CartDAO;
import com.suman.ecom.dao.ProductDAO;
import com.suman.ecom.dao.UserDAO;
import com.suman.ecom.model.Cart;
import com.suman.ecom.model.Product;
import com.suman.ecom.model.User;

@Controller

public class AdminController {

	@Autowired
	CartDAO cartDAO;

	@Autowired
	Cart cart;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	Product product;

	@Autowired
	UserDAO userDAO;

	@Autowired
	User user;

	@RequestMapping("/adminhome")
	public String ShowAdminHome() {
		return "adminhome";
	}

	// cart
	@RequestMapping(value = "/viewcart{id}")
	public ModelAndView viewmycart(@PathVariable("id") String id) {
		int s = Integer.parseInt(id);

		ModelAndView mv = new ModelAndView("mycart");
		mv.addObject("mycartList", cartDAO.listcartproducts(s));
		// mv.addObject("cartprice", cartDAO.totalprice(id));
		return mv;
	}

	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	public String buyproductPage(Model model, HttpSession session) {
		String loggedInUserId = (String) session.getAttribute("loggedInUserId");
		System.out.println(loggedInUserId);
		if (loggedInUserId == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserId = auth.getName();

		}

		System.out.println("bfr int.parseint in admin controller");
		return "/index";
	}

	@RequestMapping(value = "/buy{pid}", method = RequestMethod.POST)
	public ModelAndView buyproductPage(@Valid @PathVariable("pid") int pid, @ModelAttribute("cart") Cart car,
			BindingResult result, HttpSession session) throws Exception {

		// String nam = user.getEmailid();
		// userDAO.get(nam);
		// System.out.println("nammmm"+nam);
		String name = user.getUsername();

		// String loggedInUserId=(String) session.getAttribute(name);
		String loggedInUserId = (String) SecurityContextHolder.getContext().getAuthentication().getName();

		System.out.println("loggedinuserid===" + loggedInUserId + ".....");

		if (loggedInUserId == "anonymousUser") {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserId = auth.getName();

			ModelAndView mv = new ModelAndView("test");
			System.out.println("........check .login user");

			return mv;
		}

		else {
			ModelAndView mv = new ModelAndView("redirect:/mycart");

			cartDAO.save(car);
			
			car.setQuantity(2);
			
			System.out.println("ading to 1cartttttttt..."+car.getQuantity());
			car.setProd_id(pid);
			
			System.out.println("ading to 2cartttttttt.."+pid);
			
			//userDAO.checksignin(name);
			//user.getUser_id()
			
			car.setUser_id(cart.getUser_id());
					

			session.setAttribute("loggedInUser", user.getUsername());

			//session.getAttribute(loggedInUser);
			System.out.println("ading to 3cartttttttt..."+cart.getUser_id()+"\t "+session.getAttribute(loggedInUserId));

			car.setCartuser(user);
			
			product = productDAO.get(pid);
			car.setCartproduct(product);
			
			car.setPrice(car.getQuantity() * product.getProd_price());

			
			System.out.println("ading to cart");

			mv.addObject("mycartList", cartDAO.listcartproducts(pid));
			session.setAttribute("cartvalue", cartDAO.totalproducts(pid));
			// mv.addObject("cartprice", cartDAO.totalprice(pid));
			// mv.addObject("cartmessage",
			// cart.getCartproduct().getProd_name());
			mv.addObject("cartmessage1", " has been added to your cart");
			return mv;

		}
	}

	@RequestMapping(value = "/mycart{id}")
	public ModelAndView viewmycart1(@PathVariable("id") String id) {
		ModelAndView mv = new ModelAndView("mycart");
		// mv.addObject("mycartList", cartDAO.listcartproducts(id));
		// mv.addObject("cartprice", cartDAO.totalprice(id));
		return mv;

	}
}
