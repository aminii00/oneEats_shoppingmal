package com.example.demo.common.api.common;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonInclude;

@Component
@JsonInclude(JsonInclude.Include.NON_NULL)
public class MsgEntity {

	private String msg;
	private Object result;

	public MsgEntity(String msg, Object result) {
		this.msg = msg;
		this.result = result;
	}
}
