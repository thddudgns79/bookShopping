package dto;

import java.util.ArrayList;

import lombok.Data;


@Data
public class SelectDibDto {
	private int book_no;
	private String book_name;
	private ArrayList<AuthorDto> authorList;
	private String author_name;
	private String user_id;
}

