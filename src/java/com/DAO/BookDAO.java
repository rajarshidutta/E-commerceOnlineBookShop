
package com.DAO;

import com.entity.BookDtls;
import java.util.List;

/**
 *
 * @author Rajarshi
 */

public interface BookDAO {
    public boolean addBooks(BookDtls b);
    
    public List<BookDtls> getAllBooks();
    
    public BookDtls getBookById(int id);
    
    public boolean updateEditBooks(BookDtls b);
    
    public boolean deleteBooksById(int id);
    
    public List<BookDtls> getNewBook();
    
    public List<BookDtls> getRecentBooks();
    
    public List<BookDtls> getOldBooks();
    
    public List<BookDtls> getAllRecentBook();
    
    public List<BookDtls> getAllNewBook();
    
    public List<BookDtls> getAllOldBook();
    
    public List<BookDtls> getBookByOld(String email,String cate);
    
    public boolean oldBookDelete(String email,String cate,int bid);
    
    public List<BookDtls> getBookBySearch(String ch);
    
}
