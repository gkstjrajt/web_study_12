package web_study_12.controller.model;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import web_study_12.controller.Command;
import web_study_12.dto.Board;
import web_study_12.service.BoardService;

public class BoardWriteModel implements Command {
	private BoardService service = new BoardService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");
			return "board/boardWrite.jsp";
		} else {
			System.out.println("POST");
			Gson gson = new Gson();
			Board newBoard = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Board.class);
			System.out.println(newBoard);
			
			int res = service.addBoard(newBoard);
			response.getWriter().print(res);
			return null;
		}
		
	}

}
