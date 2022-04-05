package com.ecommerce.dao;

import com.ecommerce.entity.User;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDAO {

    private SessionFactory factory;

    public UserDAO(SessionFactory factory) {
        this.factory = factory;
    }

    //get user by email and password
    public User getUserByEmailAndPassword(String userEmail, String userPassword) {

        User user = null;

        try {
            String query = "from User where userEmail=:e and userPassword=:p";
            Session session = this.factory.openSession();

            Query q = session.createQuery(query);

            q.setParameter("e", userEmail);
            q.setParameter("p", userPassword);

            user = (User) q.uniqueResult();

            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    public List<User> getUsers(){
        Session openSession = this.factory.openSession();
        
        Query createQuery = openSession.createQuery("from User");
        
        List<User> list = createQuery.list();
        
        openSession.close();
        
        return list;
    }
    

}
