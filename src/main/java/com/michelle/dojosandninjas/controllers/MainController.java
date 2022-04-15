package com.michelle.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.michelle.dojosandninjas.models.Dojo;
import com.michelle.dojosandninjas.models.Ninja;
import com.michelle.dojosandninjas.services.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;

	// redirect homepage
	@GetMapping("/")
	public String index() {
		return "redirect:/dojos";
	}

	// get dojo
	@GetMapping("/dojos")
	public String allDojos(Model model) {
		List<Dojo> dojos = mainService.allDojos();
		model.addAttribute("dojos",dojos);
		return "allDojo.jsp";
	}

	// new dojo
	@GetMapping("/dojos/new")
	public String newDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "newDojo.jsp";
	}

	@PostMapping("/dojos/new")
	public String makeDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "newDojo.jsp";
		} else {
			mainService.createDojo(dojo);
			return "redirect:/dojos";
		}
	}

	// get one dojo
	@GetMapping("/dojos/{id}")
	public String ninjasDojo(@PathVariable("id") Long id, Model model) {
		Dojo dojo = mainService.findDojo(id);
		model.addAttribute("dojo", dojo);
		return "showDojo.jsp";
	}

	// new ninja
	@GetMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> allDojos = mainService.allDojos();
		model.addAttribute("dojos", allDojos);
		return "newNinja.jsp";
	}

	@PostMapping("/ninjas/new")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Dojo> allDojos = mainService.allDojos();
			model.addAttribute("dojos", allDojos);
			return "newNinja.jsp";
		} else {
			mainService.createNinja(ninja);
			return "redirect:/dojos/" + ninja.getDojo().getId();
		}
	}
}
