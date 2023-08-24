package com.example.demo.common.api.kakao.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.common.api.common.MsgEntity;
import com.example.demo.common.api.kakao.dto.KakaoDTO;
import com.example.demo.common.api.kakao.service.KakaoService;

@Controller
@RequestMapping("kakao")
public class KakaoController {
	
	@Autowired
    private KakaoService kakaoService;

    @GetMapping("/callback")
    public ResponseEntity<MsgEntity> callback(HttpServletRequest request) throws Exception {
        KakaoDTO kakaoInfo = kakaoService.getKakaoInfo(request.getParameter("code"));

        return ResponseEntity.ok()
                .body(new MsgEntity("Success", kakaoInfo));
    }


}
