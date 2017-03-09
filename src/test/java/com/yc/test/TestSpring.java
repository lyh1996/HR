package com.yc.test;


import java.math.BigDecimal;
import java.util.List;
import javax.sql.DataSource;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import junit.framework.TestCase;

public class TestSpring extends TestCase {

	
	 @Test
	public void testSpring1() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		DataSource ds=(DataSource) ac.getBean("dataSource");
		System.out.println(   ds );
	} 
	
	 @Test
	public void testSpring2() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		Object ds= ac.getBean("sqlSessionFactory");
		System.out.println(   ds );
	} 
	/* @Test
		public void testSpring3() {
			ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
			 BookBiz bb=ac.getBean("bookBizImpl",BookBiz.class);
			 Category c=bb.getCategory(1);
			System.out.println(   c);
		} 
	 @Test
		public void testSpring4() {
			ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
			 BookBiz bb=ac.getBean("bookBizImpl",BookBiz.class);
			 List<Category>list=bb.getAllCategories();
			 for(Category c:list){
				 System.out.println(   c);
			 }
		} 
	 @Test
		public void testSpring5() {
			ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
			 BookBiz bb=ac.getBean("bookBizImpl",BookBiz.class);
			 List<Book>list=bb.getAllBooks();
			 for(Book c:list){
				 System.out.println(   c);
			 }
		} 
	 
	 
	 @Test
	public void testSpring6() {//插入书本信息
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		 Book book=new Book();
		 BookBiz bb=(BookBiz) ac.getBean("bookBizImpl");
		 book.setBid(1);
		 book.setAuthor("Nick Pentreath");
		 book.setIsbn("978-7-115");
		 book.setTitle("Spark编程");
		 BigDecimal bd=new BigDecimal(3.4);
		 book.setPrice(bd);
		 Category c=new Category();
		 c.setCid(1);
		 book.setCategory(c);
		 book=bb.save(book);
		 System.out.println(book);
		 
	}
	 
 */
}
