package dto;

import lombok.Data;

@Data
public class CartDto {
	private String user_id;
	private int book_no; 
	private int cart_qty;
}
