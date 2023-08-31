package com.mycompany.myapp;

import java.io.IOException;

// 파이썬 파일 실행 클래스
public class Callpython {
	
	public void main() throws IOException, InterruptedException {
		
            // 파이썬 파일 실행 명령어
            String pythonCommand = "python";
    		String pythonScriptPath = "D:\\K_digital\\Go-ahead\\goahead_workspace\\Go-ahead01\\algorithm\\algorithm\\algorithm01.py"; // 파이썬
            
            // 외부 프로세스 실행
            ProcessBuilder processBuilder = new ProcessBuilder(pythonCommand, pythonScriptPath);
            Process process = processBuilder.start();

            // 프로세스 실행 결과를 읽어오기
            int exitCode = process.waitFor(); // 외부 프로세스가 종료될 때까지 대기
            System.out.println("Python script executed with exit code: " + exitCode);

	}
	
	

}
