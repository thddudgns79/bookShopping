package dto;

import lombok.Data;

@Data
public class CartBoardDto {
	private int book_no;
    private String book_name;
    private String book_publisher;
    private int book_price;
    private int book_store;
    private int cart_qty;
    private int b_c;
	private String fileName;
	private String fileType;
	private String savedName;
	private boolean checked;
    
}
