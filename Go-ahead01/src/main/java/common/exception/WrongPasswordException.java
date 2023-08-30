package common.exception;

// 아이디 비밀번호 불일치 표시 위한 클래스
public class WrongPasswordException extends RuntimeException {
	public WrongPasswordException(String message) {
		super(message);
	}
}
