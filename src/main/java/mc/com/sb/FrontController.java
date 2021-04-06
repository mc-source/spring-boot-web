package mc.com.sb;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mc.com.sb.model.Article;
import mc.com.sb.model.ArticleRepository;
import mc.com.sb.model.HelpRepository;

@Controller
public class FrontController {
	private static final Logger logger = LogManager.getLogger(FrontController.class);
	
	@Autowired
	ArticleRepository articleRepository;

	@Value("${application.name}")
	String name;
//	@Value("${welcome.message}")
//	String message;
	

	@GetMapping("/")
	public String welcome(Model model) {
		//model.addAttribute("message", message);
		model.addAttribute("links", HelpRepository.links);		

		return "index";
	}
	@GetMapping("/welcome")
	public @ResponseBody String hello(@RequestParam(value = "message", defaultValue = "Welcome MC") String message) {
		return String.format("%s : %s!", name, message);
	}
	@GetMapping("/error")
	public String page(Model model) {
		return "error";
	}
	
	@GetMapping("/{page}")
	public String page(Model model, @PathVariable String page) {	
		return preparePage(page, 0, model);
	}
	@GetMapping("/{page}/{id:[0-9]+}")
	public String detail(Model model, @PathVariable(value = "page", required = true) String page,
			@PathVariable(value = "id", required = true) int id ) {	
		return preparePage(page, id, model);
	}
	
	private String preparePage(String page, int id, Model model) {
		logger.info("page = "+page+" | ID = "+id);
		setModel(model, page, id);	
		model.addAttribute("title", formatted(page));
		return page;
	}

	private void setModel(Model model, String page, int id) {
		if(page.equals("articles")) {			
			if(id==0) {
				Iterable<Article> items = articleRepository.findAll();
				model.addAttribute("items", items);
			}else {
				model.addAttribute("subtitle", "Detail");
				model.addAttribute("item", articleRepository.findById(id));
			}
		}
	}
	private String formatted(String page) {
		return page.substring(0,1).toUpperCase()+page.substring(1).toLowerCase();
	}
}
