package kr.co.literal.member;

import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.utility.MyAuthenticator;

@Service
public class MemberService {
	
	@Autowired
    private MemberDAO memberDAO;
	
	
	// memberDAO.getMemberByEmail(email)를 호출하여 이메일을 기준으로 회원 정보를 조회
    public MemberDTO login(String email, String password) {
        MemberDTO member = memberDAO.getMemberByEmail(email);
        if (member != null && member.getPassword().equals(password)) {
            return member;
        }
        return null;
    }// login() end
    
    
 // 회원등록
    public void registerMember(MemberDTO memberDTO) {
        memberDAO.insertMember(memberDTO);
    }//registerMember() end
    
    
	 // 이메일 중복 확인 메서드
    public int duplicateEmail(String email) {
        return memberDAO.duplicateEmail(email);
    }//duplicateEmail() end
    
    
    //회원 이메일 찾기
    public MemberDTO findId(MemberDTO member) {
        return memberDAO.findByNameAndPhone(member.getName(), member.getPhone_number());
    }//findId() end
    
    
    //회원 비밀번호 찾기
    public MemberDTO findPW(MemberDTO member) {
        MemberDTO foundMember = memberDAO.findByNameAndEmail(member.getName(), member.getEmail());
        if (foundMember != null) {
            // 임시 비밀번호 생성
            String tempPassword = generateTempPassword();
            // 임시 비밀번호를 데이터베이스에 업데이트 (평문)
            foundMember.setPassword(tempPassword);
            memberDAO.updatePassword(foundMember);
            System.out.println("tempPassword: " + tempPassword);
            // 임시 비밀번호를 이메일로 전송
            sendEmailWithTempPassword(foundMember, tempPassword);
            return foundMember;
        }// if end
        return null;
    }//findPW () end
    
    
    private String generateTempPassword() {
        // 임시 비밀번호 생성 로직
        // 8자리의 임시 비밀번호를 생성하는 코드 
        // UUID는 범용 고유 식별자
        return UUID.randomUUID().toString().substring(0, 8);
    }//generateTempPassword() end
    
    
    
    private void sendEmailWithTempPassword(MemberDTO member, String tempPassword) {
        // 이메일 전송 로직
        try {
            String mailServer = "smtp.gmail.com"; // Gmail SMTP 서버
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            props.put("mail.smtp.host", mailServer);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");

            // Gmail 계정 인증 정보
            final String username = "aekyung0896@gmail.com";
            final String password = "kphszxcjoerrbvyf";

            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(username));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member.getEmail()));
            msg.setSubject("임시 비밀번호 안내");
            msg.setContent("임시 비밀번호는 " + tempPassword + " 입니다.<br>로그인 후 비밀번호를 변경해주세요.", "text/html; charset=UTF-8");
            msg.setSentDate(new Date());
            Transport.send(msg);
        } catch (Exception e) {
            System.out.println("임시 비밀번호 이메일 전송 실패: " + e);
        }
    }//sendEmailWithTempPassword() end
    
    
    //회원목록
    public MemberDTO getMemberByEmail(String email) {
        return memberDAO.getMemberByEmail(email);
    }

    //회원정보수정
    public void updateMember(MemberDTO memberDTO) {
        memberDAO.updateMember(memberDTO);
    }

    //회원삭제
    public void deleteMember(String email) {
        memberDAO.deleteMember(email);
    }
    
	
}//classn end