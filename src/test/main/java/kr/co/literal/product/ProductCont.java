package kr.co.literal.product;

import java.io.File;
import java.util.Map;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import net.utility.Utility;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.literal.member.MemberDTO;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/product")
public class ProductCont {
	public ProductCont()
	{
		System.out.println("---- ProductCont() 객체 생성");
	} // public ProductCont() end
	
	@Autowired
	private ProductDAO productDao;
	
	//결과확인
	//-> http://localhost:8080/product/list

	@RequestMapping("/productlist")
	public ModelAndView productlist() {
	   ModelAndView mav = new ModelAndView();
	   mav.addObject("list", productDao.list());
	   mav.setViewName("/product/productlist");
	   return mav;
	 } // list() end
	
	@RequestMapping("/G_productlist")
	public ModelAndView G_productlist() {
	   ModelAndView mav = new ModelAndView();
	   mav.addObject("list", productDao.list());
	   mav.setViewName("/product/G_productlist");
	   return mav;
	 } // list() end
	
	
	
	@GetMapping("/productwrite")
	public String prductwrite() 
	{
		return "product/productwrite";
	} // public String write() end
	
	
	@PostMapping("/insert")
	public String insert (@RequestParam Map<String, Object> map, @RequestParam("img") MultipartFile img, HttpServletRequest req)
	{
		// 이미지 파일 저장 폴더의 실제 물리적인 경로 가져오기
	    ServletContext application = req.getServletContext();
	    String imageBasePath = application.getRealPath("/storage/images");
	    //String pdfBasePath = application.getRealPath("/storage/previews");
		
		// 업로드 파일은 /storage 폴더에 저장
		String img_name = "-";
		long img_size= 0;
		if (img.getSize()>0 && img!=null && !img.isEmpty())			// 파일이 존재한다면
		{	img_size = img.getSize();
			// 전송된 파일이 /storage 파일에 존재한다면 파일명 리네임 후 filename 변수에 저장 / spring05_mymelon 참조
			try
			{
				String o_poster = img.getOriginalFilename();
				img_name = o_poster;
				
				File file = new File(imageBasePath, o_poster);	// 파일클래스에 해당 파일 담기
				
				int i = 1;
				while (file.exists()) 		// 파일이 존재한다면 
				{
					int lastDot = o_poster.lastIndexOf(".");
					img_name = o_poster.substring(0, lastDot) + "_" + i + o_poster.substring(lastDot);	// sky_1.png
					file = new File(imageBasePath, img_name);
					i++;
				} // while end
				
				img.transferTo(file);	// 파일 저장		
			} catch (Exception e)
			{
				System.out.println(e);
			}		
		} // if end
		
		map.put("img", img_name);
		map.put("img_size", img_size);
		
        // 업로드 파일은 /storage 폴더에 저장
/*        String pdf_name = "-";
        long pdf_size  = 0;
        if (pdf != null && !pdf.isEmpty()) {
            pdf_size = pdf.getSize();
            try {
                String o_poster = pdf.getOriginalFilename();
                pdf_name = o_poster;
                File file = new File(pdfBasePath, o_poster);
                int i = 1;
                while (file.exists()) {
                    int lastDot = o_poster.lastIndexOf(".");
                    pdf_name = o_poster.substring(0, lastDot) + "_" + i + o_poster.substring(lastDot);
                    file = new File(pdfBasePath, pdf_name);
                    i++;
                }
                pdf.transferTo(file);  // 파일 저장
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        map.put("preview", pdf_name);
        map.put("preview_size", pdf_size);
*/     
        // 세션에서 현재 로그인한 사용자의 이메일 가져오기
        HttpSession session = req.getSession();
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member == null) {
            // 사용자가 로그인하지 않은 경우에 대한 처리
            return "redirect:/member/login";
        }
        map.put("email", member.getEmail());

        // 지점 코드 설정
        String branchCode = "null"; // 필요에 따라 지점 코드를 가져오는 로직 추가
        map.put("branch_code", branchCode);
		
	    // genre_code로 book_code와 book_number 생성
	    String genreCode = (String) map.get("genre_code");
	    String bookCode = generateBookCode(genreCode);
	    String bookNumber = generateBookNumber(genreCode, bookCode);
	    map.put("book_code", bookCode);
	    map.put("book_number", bookNumber);
	    
		productDao.insert(map);
		
		return "redirect:/product/productlist";
	} // public String insert end

/*	
	private String generateBookCode(String genreCode) // book_code 생성 로직 (예: G-00001)
	{
	    int codeNumber = productDao.generateBookCode(genreCode); // 다음 책 번호
	    return genreCode + "-" + String.format("%05d", codeNumber); // 번호는 5자리 숫자
	    
	}

	
	private String generateBookNumber(String genreCode, String bookCode) // book_number 생성 로직 (예: G-00001001) 
	{
	    int number = productDao.getNextBookNumber(genreCode, bookCode); //  주어진 장르 코드와 책 코드에 대한 다음 책 번호
	    return bookCode + String.format("%03d", number); // 번호는 3자리 숫자
	}
*/
	
   private String generateBookCode(String genreCode) {
        int codeNumber = productDao.generateBookCode(genreCode);
        String bookCode = genreCode + "-" + String.format("%05d", codeNumber);

        while (productDao.bookCodeExists(bookCode)) {
            codeNumber++;
            bookCode = genreCode + "-" + String.format("%05d", codeNumber);
        }

        return bookCode;
    }

    private String generateBookNumber(String genreCode, String bookCode) {
        int number = productDao.getNextBookNumber(genreCode, bookCode);
        String bookNumber = bookCode + String.format("%03d", number);

        while (productDao.bookNumberExists(bookNumber)) {
            number++;
            bookNumber = bookCode + String.format("%03d", number);
        }

        return bookNumber;
    }
	    
    @GetMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String book_title) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/productlist");
        mav.addObject("list", productDao.search(book_title));
        mav.addObject("book_title", book_title);//검색어
        return mav;
    }//search() end
    
	
	@GetMapping("/productdetail/{book_number}")
	public ModelAndView productdetail(@PathVariable String book_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/productdetail");
		mav.addObject("product", productDao.detail(book_number));
		
		return mav;
	} // public ModelAndView detail() end
	
	
} // public class ProductCont end