package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.service.DentistService;

import lombok.extern.log4j.Log4j2;

@CrossOrigin
@Controller
@RequestMapping("/dentist")
@Log4j2
public class DentistController {
	@Resource
	private DentistService dentistService;
	
	@RequestMapping(value="/getDennoByDendomain", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getDennoByDendomain(@RequestParam String dendomain) {
		Dentist dentist = dentistService.getDentistByDendomain(dendomain);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("dendomain", dentist.getDendomain());
		String json = jsonObject.toString();
		
		return json;
	}
}
