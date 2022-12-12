package dto;

import lombok.Data;

@Data
public class AnswerDto {
	private int answer_no;
	private String answer_title;
	private String answer_content;
	private String answer_date;
	private int qna_no;
}