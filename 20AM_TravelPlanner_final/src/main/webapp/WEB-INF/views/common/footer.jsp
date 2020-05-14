<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>   
  <footer>
      <div class="row footer">
          <div class="col-sm-1 footer"></div>
          <div class="col-sm-2 footer">
              <ul style="list-style: none;">
                  <li>
                    <a href="">여행지</a>
                  </li>
                  <li>
                    <a href="">일정 만들기</a>
                  </li>
                  <li>
                    <a href="">게시판</a>
                  </li>
              </ul>
          </div>
          <div class="col-sm-2 footer">
              <ul style="list-style: none;">
              </li>
              <li>
                <a href="">INFORMATION</a>
              </li>
              <li>
                <a href="">FAQ</a>
              </li>
              </ul>
          </div>
          <div class="col-sm-7 footer"></div>
      </div>
      <div class="col footer" style="text-align: center; color: white;">Copyright ⓒ 2020 eSigukea.com, All Rights Reserved.</div>
  </footer>
</body>
</html>