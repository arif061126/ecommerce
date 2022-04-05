package com.ecommerce.dao;


import com.ecommerce.entity.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDAO {
    private SessionFactory factory;

    public ProductDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public int saveProduct(Product p){
        Session openSession = this.factory.openSession();
        Transaction beginTransaction = openSession.beginTransaction();
        
        int pId =(int) openSession.save(p);
        
        beginTransaction.commit();
        openSession.close();
        
        return pId;
    }
    
    public List<Product> getProducts(){
        Session openSession = this.factory.openSession();
//        Transaction t = openSession.beginTransaction();
        
        Query createQuery = openSession.createQuery("from Product");
        List list = createQuery.list();
        
//        t.commit();
        openSession.close();
        
        return list;
    }
    
    public List<Product> getProductsByCategory(int cId){
        Session openSession = this.factory.openSession();
//        Transaction t = openSession.beginTransaction();
        
        Query createQuery = openSession.createQuery("from Product as p where p.pCategory.catId=:id");
        createQuery.setParameter("id", cId);
        List list = createQuery.list();
        
//        t.commit();
        openSession.close();
        
        return list;
    }
    
}
