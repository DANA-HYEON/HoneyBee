package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.MsgVO;

public interface MsgService {

	public List<MsgVO> getrcvList(String id); // 수신메시지 리스트 가져오기

	public List<MsgVO> getsendList(String id); // 발신메시지 리스트 가져오기

	public void rcvmsgremove(String msgmno); //수신메세지 삭제
	
	public void sendmsgremove(String msgmno); //발신메세지 삭제
	
	public void sendmsg(MsgVO msg); // 메세지 보내기
}
