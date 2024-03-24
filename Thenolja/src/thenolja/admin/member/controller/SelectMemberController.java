package thenolja.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thenolja.admin.member.model.service.MemberService;
import thenolja.admin.member.model.vo.Member;
import thenolja.common.model.vo.PageInfo;

/**
 * Servlet implementation class selectMemberController
 */
@WebServlet("/selectMember")
public class SelectMemberController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int listCount;
      int currentPage;
      int pageLimit;
      int boardLimit;
      
      int maxPage;
      int startPage;
      int endPage;
      
      listCount = new MemberService().selectListCount();
      
      currentPage = Integer.parseInt(request.getParameter("currentPage"));
      
      pageLimit = 5;
      
      boardLimit = 15;
      
      maxPage = (int)Math.ceil((double)listCount / boardLimit);
      
      startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
      
      endPage = startPage + pageLimit - 1;
      
      if(endPage > maxPage) {
         
         endPage = maxPage;
      }
      
      
      PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
      
      
      
      
      ArrayList<Member> list = new MemberService().selectMemberList(pi);
      request.setAttribute("selectMemberList", list);
      request.setAttribute("pageInfo", pi);

      RequestDispatcher view = request.getRequestDispatcher("/views/admin/member/memberList.jsp");
      view.forward(request, response);
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}