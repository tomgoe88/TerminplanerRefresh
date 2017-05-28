package Controller;

import Model.ResourceController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Jutom on 28.05.2017.
 */
@Controller
public class ArbeitszeitController {
    @RequestMapping("/arbeitszeit")
    public ModelAndView resources (){
        ResourceController resourceController=new ResourceController();
        String resources = resourceController.getResources();
        return new ModelAndView("arbeitszeit","resources",resourceController);
    }

}
