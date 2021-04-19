package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.AttachFileDTO;

public interface FreeAttachMapper {
	
	public void insert(AttachFileDTO dto); // 첨부파일 저장
	
	public void delete(String uuid); // 첨부파일 삭제
	
	public List<AttachFileDTO> findByFno(Long fno); // 게시물 번호로 첨부파일 찾기

}
