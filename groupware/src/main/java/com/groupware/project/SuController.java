package com.groupware.project;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SuController {

	@Autowired
	private EmployeesDAO edao;
	@Value("${image.upload.directory}")
	private String imageUploadDirectory;

	@GetMapping("/manage/showEmployee")
	public String showEmployee(HttpServletRequest req, Model model) {
		// 페이지 넘버 먹여서 직원리스트
		int start, psize;
		String page = req.getParameter("pageno");
		if (page == null || page.equals("")) {
			page = "1";
		}
		int pno = Integer.parseInt(page);
		start = (pno - 1) * 10;
		psize = 10;
		ArrayList<EmployeesDTO> alEmp = edao.getList(start, psize);

		int cnt = edao.getTotal();
		int pagecount = (int) Math.ceil(cnt / 10.0);

		String pagestr = "";
		for (int i = 1; i <= pagecount; i++) {
			if (pno == i) {
				pagestr += i + "&nbsp;";
			} else {
				pagestr += "<a href='/manage/showEmployee?pageno=" + i + "'>" + i + "</a>&nbsp;";
			}
		}
		model.addAttribute("pagestr", pagestr);
		model.addAttribute("Elist", alEmp);

		return "/manage/showEmployee";
	}

	@PostMapping("/signup")
	public String signup(HttpServletRequest req, @RequestParam(name = "profileIMG") MultipartFile profileIMG) {
		try {
			String userid = req.getParameter("userid");
			String password = req.getParameter("password");
			String name = req.getParameter("name");
			String departmentID = req.getParameter("departmentID");
			String position = req.getParameter("position");
			String birthdate = req.getParameter("birthday");
			String phoneNumber = req.getParameter("phoneNumber");
			String address = req.getParameter("address");
			String email = req.getParameter("email");
			String salary = req.getParameter("salary");
			String hireDate = req.getParameter("hireDate");

			String fileName = userid + "_" + name + ".jpg";
			String filePath = imageUploadDirectory + "/" + fileName;
			profileIMG.transferTo(new File(filePath));

			edao.signup(userid, password, name, departmentID, position, birthdate, phoneNumber, address, email, salary,
					fileName, hireDate);
			System.out.println("성공");
			return "redirect:/manage/showEmployee";
		} catch (Exception e) {
			e.printStackTrace();
			// 오류 페이지로 리다이렉트 또는 오류 메시지를 반환할 수 있습니다.
			return "errorPage";
		}
	}

	@PostMapping("/deleteEMP")
	public String deleteEMP(HttpServletRequest req) {
		try {
			String userid = req.getParameter("userid");
			String name = req.getParameter("name");
			System.out.println("사번=	" + userid);
			System.out.println("이름=" + name);
			edao.deleteEMP(userid);

			String fileName = userid + "_" + name + ".jpg";
			String filePath = imageUploadDirectory + "/" + fileName;
			File file = new File(filePath);
			if (file.delete()) {
				System.out.println("이미지 파일 삭제 성공:" + filePath);
			} else {
				System.out.println("이미지 파일 삭제 실패:" + filePath);
			}
			return "manage/showEmployee";
		} catch (Exception e) {
			e.printStackTrace();
			return "errorPage";
		}
	}
	
	@GetMapping("/manage/account")
	public String account(HttpServletRequest req, Model model) {
			String userid = req.getParameter("userid");
			ArrayList<EmployeesDTO> alEmp = edao.getListSelect(userid);
			
			model.addAttribute("Elist",alEmp);
			return "/manage/account";
	}
	@PostMapping("/EMPmodify")
	@ResponseBody
	public String EMPmodify(HttpServletRequest req, @RequestParam(name = "profileIMG") MultipartFile profileIMG) {
	    try {
	        // 클라이언트에서 전송된 데이터 파라미터를 가져옵니다.
	        String userid = req.getParameter("userid"); // 직원의 사용자 아이디
	        String editedName = req.getParameter("editedName"); // 수정된 이름
	        int editedDepartment = Integer.parseInt(req.getParameter("editedDepartment")); // 수정된 부서
	        String editedPosition = req.getParameter("editedPosition"); // 수정된 직급
	        String editedPhoneNumber = req.getParameter("editedPhoneNumber"); // 수정된 전화번호
	        String editedAddress = req.getParameter("editedAddress"); // 수정된 주소
	        String editedEmail = req.getParameter("editedEmail"); // 수정된 이메일
	        String editedSalary = req.getParameter("editedSalary"); // 수정된 급여

	        
	        String filePath = null;
	        // 프로필 이미지 파일을 서버에 업로드하고, 기존 이미지 파일 삭제
	        if (!profileIMG.isEmpty()) {
	            // 이미지 파일명을 생성 (userid_name.jpg 형식)
	            String fileName = userid + "_" + editedName + ".jpg"; // 예시로 확장자는 jpg로 가정합니다.

	            // 업로드할 이미지 파일의 경로를 설정 (예: /uploads/userid_name.jpg)
	            filePath = imageUploadDirectory + "/" + fileName;

	            // 이미지 파일을 서버에 저장
	            profileIMG.transferTo(new File(filePath));

	            // 기존 프로필 이미지 파일을 삭제
	            String previousImageFileName = userid + "_" + editedName + ".jpg";
	            String previousImageFilePath = imageUploadDirectory + "/" + previousImageFileName;
	            File previousImageFile = new File(previousImageFilePath);

	            // 파일을 삭제하기 전에 존재 여부를 확인하는 것이 안전합니다.
	            if (previousImageFile.exists()) {
	                previousImageFile.delete();
	            }
	        }

	        // 수정된 직원 정보를 데이터베이스에 저장 (이 부분은 데이터베이스 처리를 위한 DAO 클래스를 활용해야 합니다)
	        // edao.modify() 메서드에는 이미지 파일 경로도 포함되어야 합니다.
	        edao.modify(editedName, editedDepartment, editedPosition, editedPhoneNumber, editedAddress, editedEmail, editedSalary, filePath, userid);

	        // 수정이 성공적으로 처리되었음을 클라이언트에 응답
	        return "success";
	    } catch (Exception e) {
	        // 오류가 발생했을 때 처리
	        e.printStackTrace(); // 오류 로그를 기록
	        return "error"; // 오류 응답
	    }
	}
}
