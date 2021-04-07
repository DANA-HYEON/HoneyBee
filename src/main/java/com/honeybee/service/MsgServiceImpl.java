package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.MsgVO;
import com.honeybee.mapper.MsgMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MsgServiceImpl implements MsgService {

	@Setter(onMethod_ = @Autowired)
	private MsgMapper mmapper;

	@Override
	public List<MsgVO> getrcvList(String id) {
		log.info("getlist.............");
		return mmapper.getrcvList(id);// 수신메시지 리스트 가져오기
	}

	@Override
	public List<MsgVO> getsendList(String id) {
		log.info("getlist.............");
		return mmapper.getsendList(id);// 발신메시지 리스트 가져오기
	}

	@Override
	public void rcvmsgremove(String msgmno) {
		log.info("msgdelete...........");
		mmapper.rcvmsgremove(msgmno);
	}

	@Override
	public void sendmsgremove(String msgmno) {
		log.info("sendmsgdelete............");
		mmapper.sendmsgremove(msgmno);
	}
	
	@Override
	public void sendmsg(MsgVO msg) {
		log.info("sendmsg...............");
		mmapper.sendmsg(msg);
	}
}
