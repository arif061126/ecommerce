package com.ecommerce.dao;

import com.ecommerce.entity.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDAO {

    private SessionFactory factory;

    public CategoryDAO(SessionFactory factory) {
        this.factory = factory;
    }

    //save the category into db:
    public int saveCategory(Category cat) {
        Session s = this.factory.openSession();
        Transaction t = s.beginTransaction();

        int catId = (int) s.save(cat);
            
        
        t.commit();
        s.close();
        
        return catId;

    }

    //list
    public List<Category> getCategory(){
        Session openSession = this.factory.openSession();
//        Transaction beginTransaction = openSession.beginTransaction();
        
        Query createQuery = openSession.createQuery("from Category");
        
        List<Category> list = createQuery.list();
        
//        beginTransaction.commit();
        openSession.close();
        
        return list;
    }
    
    public Category getCategoryById(int cId){
        Category cat = null;
        
        try {
            Session openSession = this.factory.openSession();
            cat = openSession.get(Category.class, cId);
            
            openSession.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return cat;
        
    }

}
