package Controller;

import Model.ResourceController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Jutom on 28.05.2017.
 */
@Controller
public class HelloWorldController {
    @RequestMapping("/hello")
    public ModelAndView helloWorld(){
        ResourceController resourceController= new ResourceController();
        String message =  resourceController.getEvents();
        String resource = resourceController.getResources();
        return new ModelAndView("hellopage", "message", message+" "+resource);
    }
}
