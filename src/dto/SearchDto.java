package dto;

import java.util.ArrayList;

import lombok.Data;

@Data
public class SearchDto {
	private String search;
    private int book_no;
    private String book_name;
    private String book_detail;
    private String book_date;
    private String book_publisher;
    private int book_price;
    private int reviews_avg;
    private String fileName;
    private ArrayList<AuthorDto> authorList;
    private ArrayList<BookHashDto> hashList;
}
