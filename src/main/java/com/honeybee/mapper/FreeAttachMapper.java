package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.AttachFileDTO;

public interface FreeAttachMapper {
	
	public void insert(AttachFileDTO dto);
	
	public void delete(String uuid);
	
	public List<AttachFileDTO> findByFno(Long fno);

}
