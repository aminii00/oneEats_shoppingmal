package com.example.demo.common.functions;

public class GeneralFunctions {
	public static boolean isInteger(String string) {
		boolean isInteger = string.matches("-?\\d+");
		return isInteger;
		
	}
}
