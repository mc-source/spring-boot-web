package mc.com.sb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@SpringBootApplication
//@Controller
public class SpringbootWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootWebApplication.class, args);
	}

	//	@GetMapping("/")
	//	public @ResponseBody String hello(@RequestParam(value = "name", defaultValue = "World") String name) {
	//		return String.format("Hello %s!", name);
	//	}
}
