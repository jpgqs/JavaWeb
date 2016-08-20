package com.bean;

import java.util.ArrayList;

import com.dao.BookBPO;
import com.util.hibernate.DataStore;

public class Book {

	private String id;
	private String name;
	private String publisher;
	private String author;
	private double price;
	private int isbooks;//‘§∂©±Í÷æ
	/**
	 * @return the isbooks
	 */
	public int getIsbooks() {
		return isbooks;
	}
	/**
	 * @param isbooks the isbooks to set
	 */
	public void setIsbooks(int isbooks) {
		this.isbooks = isbooks;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the publisher
	 */
	public String getPublisher() {
		return publisher;
	}
	/**
	 * @param publisher the publisher to set
	 */
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	
	public static ArrayList<Book> getBooksList(String id) throws Exception {
		return BookBPO.getBooksList(id);
	}
	
	public static void updateBookFlag(String studentId,String bookId) throws Exception {
		BookBPO.updateBookFlag(studentId,bookId);
	}
	
	public void add() throws Exception {
		BookBPO.add(this);
	}
	public static void addAll(DataStore ds) throws Exception {
		BookBPO.addAll(ds);
	}
	
	public static Book extSearch(String condition) throws Exception {
		
		return BookBPO.extSearch(condition);
	}
	
	public void alter() throws Exception {
		BookBPO.alter(this);
	}
	
	public static ArrayList<Book> search(String condition) throws Exception {
		return BookBPO.search(condition);
	}
	public static void delete(String id) throws Exception {
		BookBPO.delete(id);
	}
}
