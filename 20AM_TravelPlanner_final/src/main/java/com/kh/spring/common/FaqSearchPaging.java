package com.kh.spring.common;

public class FaqSearchPaging {
	
	public static String getPage(int totalData, int cPage, int numPerpage, String url) {
		
		String pageBar="";
	      
	      int pageBarSize=5;
	      
	      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	      int pageEnd=pageNo+pageBarSize-1;
	      
	      int totalPage=(int)Math.ceil((double)totalData/numPerpage);
	      
	      
	      pageBar+="<ul class='pagination "
	            + "justify-content-center pagination-sm'>";
	      if(pageNo==1) {
	         pageBar+="<li class='page-item disabled'>";
	         pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	         pageBar+="</li>";
	      }else {
	         pageBar+="<li class='page-item'>";
	         pageBar+="<a class='page-link' href='javascript:fn_search_btn("+(pageNo-1)+")'>이전</a>";
	         pageBar+="</li>";
	      }
	      
	      while(!(pageNo>pageEnd||pageNo>totalPage)) {
	         if(cPage==pageNo) {
	            pageBar+="<li class='page-item active'>";
	            pageBar+="<a class='page-link' href='javascript:fn_search_btn("+pageNo+")'>"+pageNo+"</a>";
	            pageBar+="</li>";
	         }else {
	            pageBar+="<li class='page-item'>";
	            pageBar+="<a class='page-link' href='javascript:fn_search_btn("+pageNo+")'>"+pageNo+"</a>";
	            pageBar+="</li>";
	         }
	         pageNo++;
	      }
	      
	      if(pageNo>totalPage) {
	         pageBar+="<li class='page-item disabled'>";
	         pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
	         pageBar+="</li>";
	      }else {
	         pageBar+="<li class='page-item'>";
	         pageBar+="<a class='page-link' href='javascript:fn_search_btn("+pageNo+")'>다음</a>";
	         pageBar+="</li>";
	      }
	      pageBar+="</ul>";
	      pageBar+="<script>";
	      pageBar+="function fn_paging(cPage){";
	      pageBar+="location.href='"+url+"?cPage='+cPage";
	      pageBar+="}";
	      pageBar+="</script>";
	      
	      return pageBar;
	}
	
	
	
	
	
	
	
	
	
}
