package action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.*;

import svc.ItemWriteProService;
import vo.ActionForward;
import vo.ItemBean;

/*
 * 파일 업로드로 올려도 에디터 이미지가 같이 들어가는 문제가 있음
 */

public class ItemWriteProAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		String realFolder = context.getRealPath("/upload");
		
		int fileSize = 1024 * 1024 * 30;
		String filename = "";
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = mr.getFileNames();
			
			String file = (String)files.nextElement();
			filename = mr.getFilesystemName(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ParameterBlock pb = new ParameterBlock();
		pb.add(realFolder + "/" + filename);
		RenderedOp rop = JAI.create("fileload", pb);
		
		BufferedImage bi = rop.getAsBufferedImage();
		BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
		
		Graphics2D g2 = thumb.createGraphics();
		g2.drawImage(bi, 0, 0, 100, 100, null);
		
		File file = new File(realFolder, "/sm_" + filename);
		ImageIO.write(thumb, "jpg", file);
		
		ItemBean itemBean = new ItemBean();
		itemBean.setName(mr.getParameter("subject"));
		itemBean.setWriteTime(new Timestamp(System.currentTimeMillis()));
		itemBean.setEndTime(mr.getParameter("datetime_end"));
		itemBean.setStartPrice(Integer.parseInt(mr.getParameter("price_start").replace(",", "")));
		itemBean.setMaxPrice(Integer.parseInt(mr.getParameter("price_end").replace(",", "")));
		itemBean.setDeliveryPrice(Integer.parseInt(mr.getParameter("price_delivery").replace(",", "")));
		itemBean.setContent(mr.getParameter("content"));
		itemBean.setCategory(mr.getParameter("category"));
		
		HttpSession session = request.getSession(false);
//		String memberID = (String)session.getAttribute("memberID");
		
//		itemBean.setMemberID(memberID);
		itemBean.setThumbnail("sm_" + filename);

		// registArticle() 메서드를 호출하여 글 등록 요청
		ItemWriteProService iwps = new ItemWriteProService();
		boolean isSuccess = iwps.registArticle(itemBean);
		
		if(!isSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('상품 등록에 문제가 발생하였습니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("list.it");
		}

		return forward;
	}

}
