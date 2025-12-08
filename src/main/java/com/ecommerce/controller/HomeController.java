package com.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {
	@GetMapping("/index")
	public String index () { 
		return"index" ;
	     }
		
		
		@GetMapping("/login")
	public String login () { 
		return"login";
	       }
		@GetMapping("/Register")
   public String Register () { 
			return"Register";
}
}
