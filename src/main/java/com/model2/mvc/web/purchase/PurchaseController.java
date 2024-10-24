package com.model2.mvc.web.purchase;
// W 24... 

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model2.mvc.common.Paging;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.TranCodeMapper;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("${pageSize}")
	int pageSize;
	
	@Value("${pageUnit}")
	int pageUnit;
	
	
	// Constructor
	public PurchaseController() {
		System.out.println(":: " + getClass().getSimpleName() + " default Constructor call\n");
	}

	
	// Method
	// 구매이력 목록
	@RequestMapping("/listPurchase")
	public ModelAndView listPurchase(@ModelAttribute Search search,
									 @RequestParam(required = false, defaultValue = "1") int historyPage,
									 @SessionAttribute("user") User buyer,
									 HttpSession session) {
		
		System.out.println("/listPurchase");
		
		ModelAndView modelAndView = new ModelAndView();
		// Model 에 실을 map
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		/* Interceptor로 변경 필요 */
		if (buyer == null) {
			modelAndView.setViewName("redirect:/user/login");
			return modelAndView;
		}
		
		
		/* 구매이력에 관한 로직 */
//		Search search = new Search(page, pageSize);
		search.setPageSize(pageSize);
		Map<String, Object> map = purchaseService.getPurchaseList(search, buyer.getUserId());
		Paging paging = new Paging((int) map.get("count"), search.getCurrentPage(), pageSize, pageUnit);
		
		modelMap.put("map", map);
		modelMap.put("paging", paging);
		modelMap.put("tranCodeMap", TranCodeMapper.getInstance().getMap());
		modelMap.put("search", search);
		
		
		/* listPurchaseHistory 로직 */
		Search historySearch = search.clone();
		historySearch.setPage(historyPage);

		Map<String, Object> historyMap = purchaseService.getPurchaseHistoryList(historySearch, buyer.getUserId());
		Paging historyPaging = new Paging((int) historyMap.get("count"), historySearch.getCurrentPage(), pageSize, pageUnit);
		
		modelMap.put("historyMap", historyMap);
		modelMap.put("historyPaging", historyPaging);
		modelMap.put("historySearch", historySearch);
		
		modelAndView.setViewName("forward:/purchase/listPurchase.jsp");
		modelAndView.addAllObjects(modelMap);
		
		return modelAndView;
	}
	
	
	// 구매
	@GetMapping(value="/addPurchase", params = "prodNo")
	public ModelAndView addPurchase(@RequestParam("prodNo") int prodNo) 
									throws Exception {
		
		System.out.println("/addPurchase GET");
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("forward:/purchase/addPurchaseView.jsp");
		
		Product product = productService.getProduct(prodNo);
		modelAndView.addObject("product", product);
		
		return modelAndView;
		
		
	}
	
	@PostMapping("/addPurchase")
	public ModelAndView addPurcahse(@ModelAttribute Purchase purchase) 
									throws Exception {
		
		System.out.println("/addPurchase POST");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/purchase/addPurchase.jsp");
		
		purchase = purchaseService.addPurchase(purchase);
		
		modelAndView.addObject("purchase", purchase);
		
		return modelAndView;
	}
	
	
	// 구매정보
	@RequestMapping(value="/getPurchase", params = "tranNo")
	public ModelAndView getPurchase(@RequestParam("tranNo") int tranNo) {
		
		// TODO interceptor 필요
		
		System.out.println("/getPurchase");
		
		ModelAndView modelAndView = new ModelAndView("forward:/purchase/getPurchase.jsp");
		modelAndView.addObject("purchase", purchaseService.getPurchase(tranNo));
		
		return modelAndView;
	}
	
	
	// 구매정보 변경
	@GetMapping(value="/updatePurchase", params = "tranNo")
	public ModelAndView updatePurchase(@RequestParam("tranNo") int tranNo) {
		
		System.out.println("/updatePurchase GET");
		
		ModelAndView modelAndView = new ModelAndView("forward:/purchase/updatePurchaseView.jsp");
		modelAndView.addObject("purchase", purchaseService.getPurchase(tranNo));
		
		return modelAndView;
	}
	
	@PostMapping("/updatePurchase")
	public ModelAndView updatePurchase(@ModelAttribute("purchase") Purchase purchase) {
		
		System.out.println("/updatePurchase POST");
		
		ModelAndView modelAndView = new ModelAndView("forward:/purchase/updatePurchase.jsp");
		
		modelAndView.addObject("purchase", purchaseService.updatePurchase(purchase));
		
		return modelAndView;
	}
	
	
	// 배송하기, 물건도착
	// listSale (관리자)에서 배송하기 요청
	@RequestMapping("updateTranCode")
	public ModelAndView updateTranCode(@RequestParam(required = false, defaultValue = "0") int tranNo,
									   @RequestParam(required = false, defaultValue = "0") int prodNo,
									   @ModelAttribute Search search,
									   @RequestParam String tranCode,
									   RedirectAttributes redirectAttributes) {
		
		System.out.println("/updateTranCode?"+((tranNo == 0)? "tranNo="+tranNo : "prodNo="+prodNo ));
		
		System.out.println(tranCode);
		
		if (tranNo == 0) {
			tranNo = purchaseService.getPurchaseByProdNo(prodNo).getTranNo();
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		if (tranCode.equals("3") || tranCode.equals("4")) {	// 배송하기, 물건도착
			modelAndView.setViewName("redirect:/product/manageProduct");
			
			Purchase purchase = purchaseService.getPurchase(tranNo);
			
			purchaseService.updateTranCode(purchase, tranCode);
			productService.updateTranCode(purchase.getPurchaseProd().getProdNo(), tranCode);
			
			redirectAttributes.addFlashAttribute(search);
			
		} 
		
		if (tranCode.equals("5")) {	// 구매확정
			modelAndView.setViewName("redirect:/purchase/listPurchase");
			
			Purchase purchase = purchaseService.getPurchase(tranNo);
			
			purchaseService.updateTranCode(tranNo, tranCode);
			productService.updateTranCode(purchase.getPurchaseProd().getProdNo(), tranCode);
			
			redirectAttributes.addFlashAttribute(search);
		}
		
		return modelAndView;
	}

}
// class end