package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

/**
 * Created by Jutom on 28.05.2017.
 */
@Controller
public class IndexController {
    @GetMapping("/")
    public String index(Model m){
        m.addAttribute("someAttribute","someValue");
        return "index";
    }
}
