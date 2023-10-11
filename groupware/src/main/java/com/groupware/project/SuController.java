package com.groupware.project;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

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
	
//	@Value("${document.upload.directory")
//	private String documentUploadDirectory;
//	@Autowired
//	private DocumentDAO ddao;
	
	@Autowired
	private CalendarDAO cdao;
	
	@Autowired
	private ApprovalsDAO Apdao;

	@GetMapping("/manageHome")
	public String manageHome() {
		return "/manage/manageHome";
	}

	@GetMapping("/showEmployee")
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
				pagestr += "<a href='/showEmployee?pageno=" + i + "'>" + i + "</a>&nbsp;";
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
			return "redirect:/showEmployee";
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

	@GetMapping("/account")
	public String account(HttpServletRequest req, Model model) {
		String userid = req.getParameter("userid");
		EmployeesDTO alEmp = edao.getListSelect(userid);

		model.addAttribute("emp", alEmp);
		System.out.println(alEmp.getProfilePicture());
		return "manage/account";
	}

	@GetMapping("/editAccount")
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
			return "redirect:/account?userid=" + userid;
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
	@GetMapping("/documentLibrary")
	public String documentLibrary(HttpServletRequest req, Model model,
	    @RequestParam(defaultValue = "1") int page) {
	    HttpSession session = req.getSession();
	    String userid = (String) session.getAttribute("userid");
	    String name = (String) session.getAttribute("name");

	    // 페이지당 항목 수와 시작 위치 계산
	    int itemsPerPage = 10; // 한 페이지당 보여줄 항목 수를 조정할 수 있습니다.
	    int startIndex = (page - 1) * itemsPerPage;

	    // 전체 문서 목록 조회
	    ArrayList<DocumentDTO> alDocu = ddao.getListForPage(startIndex, itemsPerPage);
	    model.addAttribute("dlist", alDocu);

	    // 전체 페이지 수 계산
	    int totalItems = ddao.getCount();

	    // 전체 자료실 데이터가 10개 미만인 경우 페이지 번호 표시 안 함
	    boolean showPageNumbers = totalItems >= itemsPerPage;

	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("documentType", "all");
	    model.addAttribute("showPageNumbers", showPageNumbers);

	    return "document/documentLibrary";
	}
	@GetMapping("/individual")
	public String individual(HttpServletRequest req, Model model,
	    @RequestParam(defaultValue = "1") int page) {
	    HttpSession session = req.getSession();
	    String userid = (String) session.getAttribute("userid");
	    String name = (String) session.getAttribute("name");

	    // 페이지당 항목 수와 시작 위치 계산
	    int itemsPerPage = 10; // 한 페이지당 보여줄 항목 수를 조정할 수 있습니다.
	    int startIndex = (page - 1) * itemsPerPage;

	    // 개인 문서 목록 조회
	    ArrayList<DocumentDTO> alIndiDocu = ddao.getListUserForPage(userid, startIndex, itemsPerPage);
	    model.addAttribute("indi", alIndiDocu);

	    // 전체 페이지 수 계산
	    int totalItems = ddao.getCountUser(userid);

	    // 개인 자료실 데이터가 10개 미만인 경우 페이지 번호 표시 안 함
	    boolean showPageNumbers = totalItems >= itemsPerPage;

	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("documentType", "individual");
	    model.addAttribute("showPageNumbers", showPageNumbers);

	    return "document/individual";
	}
	
	
	@Value("${document.upload.directory}")
	private String documentUploadDirectory;
	@Autowired
	private DocumentDAO ddao;
	
	@PostMapping("/fileUpload")
	public String fileUpload(HttpServletRequest req, @RequestParam(name = "documentFile") MultipartFile[] documentFiles) {
	    HttpSession session = req.getSession();
	    String userid = (String) session.getAttribute("userid");

	    // 대상 폴더 선택
	    String storageType = req.getParameter("storageType");

	    try {
	        for (MultipartFile documentFile : documentFiles) {
	            if (!documentFile.isEmpty()) {
	                // 업로드할 파일 정보
	                String originalFilename = documentFile.getOriginalFilename();
	                String fileType = originalFilename.substring(originalFilename.lastIndexOf('.') + 1);
	                long fileSize = documentFile.getSize();

	                // 파일 이름 중복 처리
	                String filename = originalFilename;
	                int counter = 1;
	                while (new File(documentUploadDirectory, filename).exists()) {
	                    String fileNameWithoutExtension = originalFilename.substring(0, originalFilename.lastIndexOf('.'));
	                    String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
	                    filename = fileNameWithoutExtension + " (" + counter + ")" + extension;
	                    counter++;
	                }

	                // 파일을 서버에 저장
	                String uploadDirectory = documentUploadDirectory;
	                String filePath = uploadDirectory + "/" + filename;
	                documentFile.transferTo(new File(filePath));

	                // 파일 정보를 데이터베이스에 저장 (동일한 파일 이름으로 저장)
	                ddao.insert(filename, userid, fileType, fileSize, storageType);
	            }
	        }
	        return "redirect:/documentLibrary";
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 오류 페이지로 리다이렉트 또는 오류 메시지를 반환할 수 있습니다.
	        return "errorPage";
	    }
	}
	@GetMapping("/documentDownload")
	public ResponseEntity<Resource> downloadFile(@RequestParam("fileName") String fileName) throws IOException {
	    // 업로드 디렉토리와 파일 이름을 사용하여 파일의 전체 경로 생성
	    Path filePath = Paths.get(documentUploadDirectory).resolve(fileName);

	    try {
	        Resource resource = new UrlResource(filePath.toUri());

	        // 파일이 존재하고 읽을 수 있다면 다운로드 응답을 생성
	        if (resource.exists() && resource.isReadable()) {
	            HttpHeaders responseHeaders = new HttpHeaders();

	            // 파일 이름을 UTF-8로 URL 인코딩하고 '+'를 '%20'으로 대체
	            String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8.toString())
	                    .replace("+", "%20");

	            // Content-Disposition 헤더에 인코딩된 파일 이름 추가
	            String contentDisposition = "attachment; filename=\"" + encodedFileName + "\"";
	            responseHeaders.set(HttpHeaders.CONTENT_DISPOSITION, contentDisposition);

	            // URL을 생성할 때 인코딩된 파일 이름 포함
	            String downloadUrl = ServletUriComponentsBuilder.fromCurrentContextPath()
	                    .path("/documentDownload")
	                    .queryParam("fileName", encodedFileName)
	                    .toUriString();

	            return ResponseEntity.ok()
	                    .headers(responseHeaders)
	                    .body(resource);
	        } else {
	            // 파일이 존재하지 않거나 읽을 수 없는 경우에 대한 처리
	            // 예를 들어 에러 페이지를 표시하거나 다른 처리를 수행할 수 있습니다.
	            return ResponseEntity.notFound().build();
	        }
	    } catch (MalformedURLException e) {
	        // URL 생성 오류 처리
	        e.printStackTrace();
	        // 오류 페이지를 표시하거나 다른 처리를 수행할 수 있습니다.
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	@GetMapping("/approval")
	public String approval(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");

		ArrayList<ApprovalsDTO> receipt_approval = Apdao.select_receipt_approval(userid);
		ArrayList<ApprovalsDTO> incomplete_approval = Apdao.select_incomplete_approval(userid);
		ArrayList<ApprovalsDTO> completion_approval = Apdao.select_completion_approval(userid);
		ArrayList<ApprovalsDTO> my_incomplete_approval = Apdao.select_my_incomplete_approval(userid);


		
		
		System.out.println("adssad" + my_incomplete_approval.size());
		 
		model.addAttribute("receipt_approval", receipt_approval);
		model.addAttribute("incomplete_approval", incomplete_approval);
		model.addAttribute("completion_approval", completion_approval);
		model.addAttribute("my_incomplete_approval", my_incomplete_approval);
		
		
		return "approval/approval";
	}
	
	
	@GetMapping("/arriveApproval")
	public String arriveApproval(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		ArrayList<ApprovalsDTO> arrive_approval = Apdao.arrive_approval(userid);
		model.addAttribute("arrive_approval",arrive_approval);
		return "approval/arriveApproval";
	}
	
	@GetMapping("/comeApproval")
	public String comeApproval(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		ArrayList<ApprovalsDTO> incomplete_approval = Apdao.select_incomplete_approval1(userid);
		model.addAttribute("incomplete_approval", incomplete_approval);
		return "approval/comeApproval";
	}
	
	@GetMapping("/sendApproval")
	public String sendApproval(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		ArrayList<ApprovalsDTO> send_approval = Apdao.sendList(userid);
		model.addAttribute("send_approval",send_approval);
		return "approval/sendApproval";
	}
	
	
	@GetMapping("/writeApproval")
	public String writeApproval(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		EmployeesDTO alEmp = edao.getListSelect(userid);
		model.addAttribute("alEmp",alEmp);
		
		ArrayList<EmployeesDTO> allMember = edao.getMember();
		System.out.println("asd="+ allMember.size());
		model.addAttribute("allMem", allMember);
		
		
		return "approval/writeApproval";
	}
	@PostMapping("/writeApprovalData")
	@ResponseBody
	public String writeApprovalData(@RequestParam("userid") String sender,
            @RequestParam("receiver_id") String receiver,
            @RequestParam("approvalType") String approvalType,
            @RequestParam("approvalTitle") String approvalTitle,
            @RequestParam("approText") String approText,
            Model model) {
		
		 System.out.println("userid: " + sender);
	        System.out.println("receiver_id: " + receiver);
	        System.out.println("approvalType: " + approvalType);
	        System.out.println("approvalTitle: " + approvalTitle);
	        System.out.println("approText: " + approText);
		
		Apdao.approvalInsert(sender, receiver, approvalType, approvalTitle, approText);
		
		return "";
	}
	
	@GetMapping("/approvalDetail")
	public String approvalDetail(HttpServletRequest req, Model model) {
   		int approvalID = Integer.parseInt(req.getParameter("approvalID"));
   		System.out.println(approvalID);
   		ApprovalsDTO alShow = Apdao.showDetail(approvalID);
   		model.addAttribute("alShow", alShow);
		
   		return "approval/approvalDetail";
 	}
	
	 
	@PostMapping("/update_approval_status")
	public String update_approval_status(HttpServletRequest req) {
			String userid = req.getParameter("userid");
			int approvalID = Integer.parseInt(req.getParameter("approvalID"));
			String status = req.getParameter("status");

			Apdao.statusUpdate(approvalID, status);
			
			return "approval/approval";
	}
}
