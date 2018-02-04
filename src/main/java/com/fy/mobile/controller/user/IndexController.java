package com.fy.mobile.controller.user;

import com.fy.mobile.entity.SearchResult;
import com.fy.mobile.entity.user.UserLoginDTO;
import com.fy.mobile.service.user.SearchService;
import com.fy.mobile.service.user.buy.BuyService;
import com.fy.mobile.service.user.sell.SellService;
import com.fy.mobile.util.QiniuUtil;
import com.fy.mobile.util.WebUtil;
import org.apache.catalina.core.ApplicationContext;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private BuyService buyService;
    @Autowired
    private SellService sellService;
    @Autowired
    private SearchService searchService;
    /**
     * 首页
     * @return
     */
    @RequestMapping(value = {"", "page/index"})
    public String viewToIndex(Model model){
        Map<String, String> tokenMap = QiniuUtil.getQiniuTokenInfo();
        UserLoginDTO loginDTO = WebUtil.findUserInSession(request);
        model.addAttribute("currentUser", loginDTO);
        model.addAttribute("buyNeeds", buyService.listTop8BuyNeeds());
        model.addAttribute("sellItems", sellService.listTop8SellItem());
        return "/user/index2";
    }

    /**
     * 搜索结果页面
     * @return
     */
    @RequestMapping("page/search")
    public String viewToSearch(@Param("searchWord") String searchWord, Model model){
        List<SearchResult> searchResultList = searchService.getSearchResult(searchWord);
        model.addAttribute("searchResult", searchResultList);
        return "/user/search";
    }
}
