package com.groupware.project;

import java.io.File;
import java.nio.file.Files;
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

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@MultipartConfig
@Controller
public class SuController {

	@Autowired
	private EmployeesDAO edao;
	@Value("${image.upload.directory}")
	private String imageUploadDirectory;
	@Autowired
	private CalendarDAO cdao;

	@GetMapping("/manage/manageHome")
	public String manageHome() {
		return "/manage/manageHome";
	}

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

			String fileName;

			if (profileIMG != null && !profileIMG.isEmpty()) {
				// 프로필 이미지가 제공된 경우 업로드
				fileName = userid + "_" + name + ".jpg";
				String filePath = imageUploadDirectory + "/" + fileName;
				profileIMG.transferTo(new File(filePath));
			} else {
				// 프로필 이미지가 없는 경우 기본 이미지 사용 및 복사
				String defaultImageName = "default_profile.png";
				fileName = userid + "_" + name + ".jpg";
				String defaultImagePath = imageUploadDirectory + "/" + defaultImageName;
				String targetImagePath = imageUploadDirectory + "/" + fileName;

				// 기본 이미지 파일을 복사하여 새 파일 생성
				File defaultImageFile = new File(defaultImagePath);
				File targetImageFile = new File(targetImagePath);
				Files.copy(defaultImageFile.toPath(), targetImageFile.toPath());
			}

//			String fileName = userid + "_" + name + ".jpg";
//			String filePath = imageUploadDirectory + "/" + fileName;
//			profileIMG.transferTo(new File(filePath));

			edao.signup(userid, password, name, departmentID, position, birthdate, phoneNumber, address, email, salary,
					fileName, hireDate);

			String namebirth = name + " 생일";

			cdao.birthdayToC(namebirth, birthdate);
			Thread.sleep(3000);
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
		EmployeesDTO alEmp = edao.getListSelect(userid);

		model.addAttribute("emp", alEmp);
		System.out.println(alEmp.getProfilePicture());
		return "manage/account";
	}

	@GetMapping("/manage/editAccount")
	public String editAccount(HttpServletRequest req, Model model) {
		String userid = req.getParameter("userid");
		EmployeesDTO alEmp = edao.getListSelect(userid);

		model.addAttribute("emp", alEmp);
		return "manage/editAccount";
	}

	@PostMapping("/editEMP")
	public String editEMP(HttpServletRequest req, @RequestParam(name = "profileIMG") MultipartFile profileIMG) {
		try {
			String userid = req.getParameter("userid");
			String name = req.getParameter("name");
			String departmentID = req.getParameter("departmentID");
			String position = req.getParameter("position");
			String phoneNumber = req.getParameter("phoneNumber");
			String address = req.getParameter("address");
			String email = req.getParameter("email");
			String salary = req.getParameter("salary");

			String imgName = req.getParameter("imgName");
			String fileName = "";

			// 새로운 이미지 파일을 업로드하는 경우
			if (profileIMG != null && !profileIMG.isEmpty()) {
				String deleteFile = imageUploadDirectory + "/" + imgName;

				// 이미지 삭제
				File fileToDelete = new File(deleteFile);
				if (fileToDelete.exists() && fileToDelete.isFile()) {
					if (fileToDelete.delete()) {
						System.out.println("기존 이미지 파일 삭제 성공: " + deleteFile);
					} else {
						System.out.println("기존 이미지 파일 삭제 실패: " + deleteFile);
					}
				} else {
					System.out.println("기존 이미지 파일이 존재하지 않습니다: " + deleteFile);
				}

				// 새로운 이미지 파일 업로드
				fileName = userid + "_" + name + ".jpg";
				String filePath = imageUploadDirectory + "/" + fileName;
				profileIMG.transferTo(new File(filePath));
			} else {
				// 새로운 이미지 파일을 업로드하지 않고 이름만 변경한 경우,
				// 기존 이미지 파일 이름을 변경된 이름으로 수정
				fileName = userid + "_" + name + ".jpg";
				String oldFilePath = imageUploadDirectory + "/" + imgName;
				String newFilePath = imageUploadDirectory + "/" + fileName;

				File oldFile = new File(oldFilePath);
				File newFile = new File(newFilePath);

				if (oldFile.exists() && oldFile.isFile()) {
					if (oldFile.renameTo(newFile)) {
						System.out.println("이미지 파일 이름 변경 성공: " + oldFilePath + " -> " + newFilePath);
					} else {
						System.out.println("이미지 파일 이름 변경 실패: " + oldFilePath + " -> " + newFilePath);
					}
				} else {
					System.out.println("기존 이미지 파일이 존재하지 않습니다: " + oldFilePath);
				}
			}

			edao.editEMP(name, departmentID, position, phoneNumber, address, email, salary, fileName, userid);
			Thread.sleep(4000);
			System.out.println("성공");
			return "redirect:/manage/account?userid=" + userid;
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
			// 오류 페이지로 리다이렉트 또는 오류 메시지를 반환할 수 있습니다.
			return "errorPage";
		}
	}

	@GetMapping("/myInfo")
	public String selfEdit(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		EmployeesDTO alEmp = edao.getListSelect(userid);

		model.addAttribute("emp", alEmp);

		return "myInfo";
	}

// 포스트 ajax 받아서 비밀번호 체크 /checkPassword
	@PostMapping("/checkPassword")
	@ResponseBody
	public String checkPassword(HttpServletRequest req) {
		String userid = req.getParameter("userid");
		String password = req.getParameter("password");

		System.out.println("password=" + password);

		int n = edao.login(userid, password);
		if (n == 1) {
			return "success";
		} else {
			return "failed";
		}
	}

	@PostMapping("/selfEdit")
	public String selfEdit(HttpServletRequest req, @RequestParam(name = "profileIMG") MultipartFile profileIMG) {
		try {
			HttpSession session = req.getSession();
			String userid = (String) session.getAttribute("userid");
			String name = (String) session.getAttribute("name");
			String password = req.getParameter("password1");
			String phoneNumber = req.getParameter("phoneNumber1");
			String address = req.getParameter("address1");
			String email = req.getParameter("email1");

			System.out.println(email);
			String imgName = req.getParameter("imgName");
			String fileName = "";

			// 새로운 이미지 파일을 업로드하는 경우
			if (profileIMG != null && !profileIMG.isEmpty()) {
				String deleteFile = imageUploadDirectory + "/" + imgName;

				// 이미지 삭제
				File fileToDelete = new File(deleteFile);
				if (fileToDelete.exists() && fileToDelete.isFile()) {
					if (fileToDelete.delete()) {
						System.out.println("기존 이미지 파일 삭제 성공: " + deleteFile);
					} else {
						System.out.println("기존 이미지 파일 삭제 실패: " + deleteFile);
					}
				} else {
					System.out.println("기존 이미지 파일이 존재하지 않습니다: " + deleteFile);
				}

				// 새로운 이미지 파일 업로드
				fileName = userid + "_" + name + ".jpg";
				String filePath = imageUploadDirectory + "/" + fileName;
				profileIMG.transferTo(new File(filePath));
			} else {
				// 새로운 이미지 파일을 업로드하지 않고 이름만 변경한 경우,
				// 기존 이미지 파일 이름을 변경된 이름으로 수정
				fileName = userid + "_" + name + ".jpg";
				String oldFilePath = imageUploadDirectory + "/" + imgName;
				String newFilePath = imageUploadDirectory + "/" + fileName;

				File oldFile = new File(oldFilePath);
				File newFile = new File(newFilePath);

				if (oldFile.exists() && oldFile.isFile()) {
					if (oldFile.renameTo(newFile)) {
						System.out.println("이미지 파일 이름 변경 성공: " + oldFilePath + " -> " + newFilePath);
					} else {
						System.out.println("이미지 파일 이름 변경 실패: " + oldFilePath + " -> " + newFilePath);
					}
				} else {
					System.out.println("기존 이미지 파일이 존재하지 않습니다: " + oldFilePath);
				}
			}
			
			edao.selfEdit(password, phoneNumber, address, email, userid);
			Thread.sleep(4000);
			return "redirect:/myInfo";
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
			// 오류 페이지로 리다이렉트 또는 오류 메시지를 반환할 수 있습니다.
			return "errorPage";
		}
	}
}
