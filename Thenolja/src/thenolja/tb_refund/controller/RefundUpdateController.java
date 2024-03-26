package thenolja.tb_refund.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import thenolja.tb_refund.model.service.RefundService;
import thenolja.tb_refund.model.vo.Refund;

/**
 * Servlet implementation class RefundUpdateController
 */
@WebServlet("/update.refund")
public class RefundUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int reserNo = Integer.parseInt(request.getParameter("reserNo"));
		int accNo = Integer.parseInt(request.getParameter("accNo"));
		String refundName = request.getParameter("refundName");
		String bankName = request.getParameter("bankName");
		
		
		Refund refund = new Refund();
		refund.setReserNo(reserNo);
		refund.setAccNo(accNo);
		refund.setRefundName(refundName);
		refund.setBank(bankName);
		
		int result = new RefundService().updateRefund(refund);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/detail.refund?reserNo=" + reserNo);
		
			// request.getRequestDispatcher("views/refund/refundUpdateForm.jsp").forward(request, response);
		} else {
		request.setAttribute("errorMsg", "환불 수정에 실패하였습니다");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
