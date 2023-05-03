package pes.member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.model.MemberVO;

public interface InterMemberDAO {

	
	// 페이징 처리를 안한 모든 회원 또는 검색한 회원 목록 보여주기
	List<MemberVO> selectMember(Map<String, String> paraMap) throws SQLException;


	// 페이징 처리 한 모든 회원 또는 검색한 회원 목록 보여주기
	List<MemberVO> selectPagingMember(Map<String, String> paraMap) throws SQLException;


	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;


	// userid 값을 입력 받아서 회원 1명에 대한 상세정보 알아오기
	MemberVO memberOneDetailAction(String userid) throws SQLException;

	
	
	
}
