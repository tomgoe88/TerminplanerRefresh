package Controller;

import Model.ResourceController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Jutom on 03.06.2017.
 */
@Controller
public class KundeController {
    @RequestMapping("/kunden")
    public ModelAndView resources (){

        return new ModelAndView("kunden");
    }
}
