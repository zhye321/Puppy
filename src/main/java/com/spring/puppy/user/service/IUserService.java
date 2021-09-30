package com.spring.puppy.user.service;

import java.util.Date;
import java.util.Map;

import com.spring.puppy.command.UserVO;

public interface IUserService {

	//아이디 중복 확인
	int idCheck(String id);
	
	//회원 가입
	void join(UserVO vo);
	
	//회원정보 조회
	UserVO selectOne(String id);	
	
	//자동 로그인 쿠키값 DB저장
	void keepLogin(String sessionId, Date limitTime, String account);
	
	//회원 정보 수정
	void updateUser(UserVO vo);
	
	//아이디 찾기
	String selectId(UserVO vo);
	
	//자동로그인 처리
	UserVO getUserWithSessionId(String sessionId);
	
	//회원탈퇴
	void delete(String id);

}
