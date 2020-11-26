package com.examportal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.examportal.model.User;
import com.examportal.repo.UserRepository;
import com.examportal.service.UserService;

@Controller
public class AppController {

	@Autowired
	private UserService service;

	@Autowired
	private UserRepository repo;

	@Autowired(required = true)
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("user", new User());

		return "/registration";
	}


	@RequestMapping(value = "/registration_done", method = RequestMethod.POST)
	public String registration( @Param("username") String username, @Param("role") String role,@Param("password") String password) {

		User user = new User();
		user.setUsername(username);
		user.setRole(role);
		user.setPassword(passwordEncoder.encode(password));
		repo.save(user);

		System.out.println("user added succesfully");

		return "/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {


		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "/login";
	}

	//    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
	//    public String welcome(Model model) {
	//        return "index";
	//    }
	@RequestMapping("/")
	public String viewHomePage(Model model) {
		List<User> list = service.listAll();

		model.addAttribute("list", list);
		return "/index";
	}

	@RequestMapping("/new")
	public String showNewProductPage(Model model) {
		User user = new User();
		model.addAttribute("user", user);

		return "/new_User";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveProduct(@ModelAttribute("user") User user) {
		service.save(user);

		return "redirect:/";
	}
	@RequestMapping("/edit/{id}")
	public ModelAndView showEditProductPage(@PathVariable(name = "id") int id) {
		ModelAndView mav = new ModelAndView("/edit_User");
		User user = service.get(id);
		mav.addObject("user", user);

		return mav;
	}
	@RequestMapping("/delete/{id}")
	public String deleteProduct(@PathVariable(name = "id") int id) {
		service.delete(id);
		return "redirect:/";       
	}
}