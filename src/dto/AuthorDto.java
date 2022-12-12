package dto;

import lombok.Data;

@Data
public class AuthorDto {
	private int author_no;
	private String author_name;
	private String author_detail;
	private String fileName;
	private String fileType;
	private String savedName;
}
